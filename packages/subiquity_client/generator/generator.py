#!/usr/bin/env python3

import ast
import fileinput
import os
import sys
from typing import List


class Generator(ast.NodeVisitor):
    def __init__(self):
        self.nodes = []

    def parse(self, data: str):
        node = ast.parse(data)

        node = FactoryTransformer().visit(node)
        ast.fix_missing_locations(node)

        node = DefaultTransformer().visit(node)
        ast.fix_missing_locations(node)

        node = UnionTransformer().visit(node)
        ast.fix_missing_locations(node)

        node = EnumTransformer().visit(node)
        ast.fix_missing_locations(node)

        return self.visit(node)

    def visit_ClassDef(self, node):
        self.nodes.append(ClassGenerator(node))

    def visit_EnumDef(self, node):
        self.nodes.append(EnumGenerator(node))

    def visit_UnionDef(self, node):
        self.nodes.append(UnionGenerator(node))

    def to_dart(self):
        return "".join(str(node) for node in self.nodes)


class EnumDef(ast.stmt):
    name: str
    values: list[ast.expr]


class UnionDef(ast.stmt):
    __match_args__ = ("name", "classes")
    name: str
    classes: list[ast.ClassDef]


# transforms Enum-inherited classes to EnumDefs
class EnumTransformer(ast.NodeTransformer):
    class EnumScanner(ast.NodeVisitor):
        def __init__(self):
            self.values = []

        # Assign(
        #   targets=[Name(id='RUNNING', ctx=Store())],
        #   value=Call(
        #     func=Attribute(
        #       value=Name(id='enum', ctx=Load()),
        #       attr='auto',
        #       ctx=Load()
        #     ),
        #     args=[],
        #     keywords=[]
        #   )
        # )
        def visit_Assign(self, node: ast.Assign):
            self.values.extend(node.targets)

    def visit_ClassDef(self, node: ast.ClassDef):
        if any(base.value.id == "enum" for base in node.bases):
            scanner = self.EnumScanner()
            scanner.visit(node)
            return EnumDef(name=node.name, values=scanner.values)
        return self.generic_visit(node)


# transforms "attr.factory(list)" to "[]"
class FactoryTransformer(ast.NodeTransformer):
    # Call(
    #   func=Attribute(
    #     value=Name(id='attr', ctx=Load()),
    #     attr='Factory',
    #     ctx=Load()
    #   ),
    #   args=[Name(id='list', ctx=Load())],
    #   keywords=[]
    # )
    def visit_Call(self, node: ast.Call):
        if isinstance(node.func, ast.Attribute) and node.func.attr == "Factory" and \
            isinstance(node.func.value, ast.Name) and node.func.value.id == "attr" and \
                isinstance(node.args[0], ast.Name) and node.args[0].id == "list":
            return ast.Constant(value=[])
        return self.generic_visit(node)


# transforms "attr.ib(default=foo)" to "foo"
class DefaultTransformer(ast.NodeTransformer):
    # Call(
    #   func=Attribute(
    #     value=Name(id='attr', ctx=Load()),
    #     attr='ib',
    #     ctx=Load()
    #   ),
    #   args=[],
    #   keywords=[keyword(arg='default', value=Constant(value=False))]
    # )
    def visit_Call(self, node: ast.Call):
        if isinstance(node.func, ast.Attribute) and node.func.attr == "ib" and \
                isinstance(node.func.value, ast.Name) and node.func.value.id == "attr":
            values = [k.value for k in node.keywords if k.arg == 'default']
            if len(values) == 1 and isinstance(values[0], ast.Constant):
                return values[0]
        return self.generic_visit(node)


# transforms "Union[A, B]" to ClassDefs
class UnionTransformer(ast.NodeTransformer):
    class UnionScanner(ast.NodeTransformer):
        def __init__(self):
            self.named = {}
            self.unnamed = []

        # Assign(
        #   targets=[Name(id='AnyStep', ctx=Store())],
        #   value=Subscript(
        #     value=Name(id='Union', ctx=Load()),
        #     slice=Tuple(
        #       elts=[
        #         Name(id='StepPressKey', ctx=Load()),
        #         Name(id='StepKeyPresent', ctx=Load()),
        #         Name(id='StepResult', ctx=Load())
        #       ],
        #       ctx=Load()
        #     ),
        #     ctx=Load()
        #   )
        # )
        def visit_Assign(self, node: ast.Assign):
            if len(node.targets) == 1 and isinstance(node.targets[0], ast.Name) and \
                isinstance(node.value, ast.Subscript) and \
                    isinstance(node.value.value, ast.Name) and node.value.value.id == "Union":
                names = [e.id for e in node.value.slice.elts if isinstance(e, ast.Name)]
                self.named[node.targets[0].id] = names
                return None
            return self.generic_visit(node)

        # Subscript(
        #   value=Name(id='Union', ctx=Load()),
        #   slice=Tuple(
        #     elts=[
        #       Name(id='Partition', ctx=Load()),
        #       Name(id='Gap', ctx=Load())
        #     ],
        #     ctx=Load()
        #   ),
        #   ctx=Load()
        # )
        def visit_Subscript(self, node: ast.Subscript):
            if isinstance(node.value, ast.Name) and node.value.id == "Union":
                names = [e.id for e in node.slice.elts if isinstance(e, ast.Name)]
                self.unnamed.append(names)
                return ast.Name(dart_union(names))
            return self.generic_visit(node)

    def __init__(self):
        self.scanner = self.UnionScanner()
        self.unions = {}

    def visit_ClassDef(self, node: ast.ClassDef):
        for k, v in self.scanner.named.items():
            if node.name in v:
                if k in self.unions:
                    self.unions[k].classes.append(node)
                    return None
                union = UnionDef(name=k, classes=[node])
                self.unions[k] = union
                return union
        for v in self.scanner.unnamed:
            if node.name in v:
                k = dart_union(v)
                if k in self.unions:
                    self.unions[k].classes.append(node)
                    return None
                union = UnionDef(name=k, classes=[node])
                self.unions[k] = union
                return union
        return self.generic_visit(node)

    def visit_Module(self, node: ast.Module):
        node = self.scanner.visit(node)
        return self.generic_visit(node)


# generates Dart classes
class ClassGenerator(ast.NodeVisitor):
    def __init__(self, node: ast.ClassDef):
        self.name = node.name
        self.properties = []
        self.visit(node)

    def visit_AnnAssign(self, node: ast.AnnAssign):
        self.properties.append(PropertyGenerator(node))

    def __str__(self):
        annotations = ""
        if any(property.type.startswith("Map<int,") for property in self.properties):
            annotations = "@JsonMapConverter()\n  "
        properties = "\n    ".join(str(property) for property in self.properties)
        return f"""
@freezed
class {self.name} with _${self.name} {{
  {annotations}const factory {self.name}({{
    {properties}
  }}) = _{self.name};

  factory {self.name}.fromJson(Map<String, dynamic> json) => _${self.name}FromJson(json);
}}
"""


# returns a Dart-compatible identifier name
def dart_name(name: str):
    name = camel_case(name)
    return {
        "default": "isDefault",
    }.get(name, name)


# the common prefix of all union classes, or all names joined by "Or"
def dart_union(names: List[str]):
    prefix = os.path.commonprefix(names)
    return prefix if prefix else 'Or'.join(names)


# converts snake_case to camelCase
def camel_case(name: str):
    words = name.split("_")
    return words[0][:1].lower() + words[0][1:] + "".join(word.title() for word in words[1:])


# returns the respective Dart type name for a Python type
def dart_type(node: ast.AST):
    type = ""
    if (isinstance(node, ast.Attribute)):
        node = node.value
    if (isinstance(node, ast.Name)):
        type = node.id
    elif (isinstance(node, ast.Subscript)):
        if node.value.id == "Optional":
            type = f"{dart_type(node.slice)}?"
        elif node.value.id == "List":
            type = f"List<{dart_type(node.slice)}>"
        elif node.value.id == "Dict":
            key = dart_type(node.slice.elts[0])
            value = dart_type(node.slice.elts[1])
            type = f"Map<{key}, {value}>"
    return {
        "Any": "dynamic",
        "datetime": "DateTime",
        "dict": "Map<String, dynamic>",
        "list": "List<dynamic>",
        "str": "String",
    }.get(type, type)


# returns the respective Dart value for a Python value
def dart_value(node: ast.AST):
    if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub) and isinstance(node.operand, ast.Constant):
        return -int(node.operand.value)
    if not isinstance(node, ast.Constant):
        return None
    if isinstance(node.value, bool):
        return str(node.value).lower()
    if isinstance(node.value, str):
        return f"'{node.value}'"
    if node.value is None:
        return "null"
    return str(node.value)


# generates Dart properties
class PropertyGenerator(ast.NodeVisitor):
    def __init__(self, node: ast.AnnAssign):
        self.name = node.target.id
        self.type = dart_type(node.annotation)
        self.value = None
        self.visit(node)

    def visit_AnnAssign(self, node):
        self.value = dart_value(node.value)

    def __str__(self):
        name = dart_name(self.name)
        property = f"{self.type} {name}"
        if self.value is None:
            property = f"required {property}"
        if name != camel_case(self.name):
            property = f"@JsonKey(name: '{self.name}') {property}"
        if self.value is not None and self.value != "null":
            property = f"@Default({self.value}) {property}"
        return f"{property},"


# generates Freezed unions for Dart
class UnionGenerator(ast.NodeVisitor):
    def __init__(self, node: UnionDef):
        self.name = node.name
        self.classes = [ClassGenerator(c) for c in node.classes]

    def _format(self, cls: ClassGenerator):
        annotations = ""
        if any(p.type.startswith("Map<int,") for p in cls.properties):
            annotations = "@JsonMapConverter()\n  "
        properties = "\n    ".join(str(p) for p in cls.properties)
        if cls.name.startswith(self.name):
            ctor = dart_name(cls.name[len(self.name):])
        else:
            ctor = dart_name(cls.name)
        return f"""
  @FreezedUnionValue('{cls.name}')
  {annotations}const factory {self.name}.{ctor}({{
    {properties}
  }}) = {cls.name};
"""

    def __str__(self):
        classes = "".join(self._format(c) for c in self.classes)
        return f"""
@Freezed(unionKey: '\\$type', unionValueCase: FreezedUnionCase.pascal)
class {self.name} with _${self.name} {{
{classes}
  factory {self.name}.fromJson(Map<String, dynamic> json) => _${self.name}FromJson(json);
}}
"""


# generates Dart enums
class EnumGenerator:
    def __init__(self, node: EnumDef):
        self.name = node.name
        self.values = node.values

    def __str__(self):
        values = ",\n  ".join([v.id for v in self.values if isinstance(v, ast.Name)])
        return f"""
enum {self.name} {{
  {values},
}}
"""


def main():
    input = sys.argv[1] if len(sys.argv) > 1 else ""
    output = sys.argv[2] if len(sys.argv) == 3 else None

    if not input.endswith(".py") or (output is not None and not output.endswith(".dart")):
        print("usage: generator <input.py> (<output.dart>)")
        return

    generator = Generator()
    with open(sys.argv[1], "r") as file:
        generator.parse(file.read())

    data = generator.to_dart()
    if output is None:
        print(data)
    else:
        generated_line = False
        for line in fileinput.input(output, inplace=True):
            if not generated_line:
                print(line.rstrip())
            if line.startswith("// BEGIN GENERATED CODE"):
                print(data)
                generated_line = True
            elif line.startswith("// END GENERATED CODE"):
                print(line.rstrip())
                generated_line = False


if __name__ == "__main__":
    sys.exit(main())
