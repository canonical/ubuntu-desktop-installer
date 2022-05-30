#!/usr/bin/env python3

import ast
import fileinput
import sys

class EnumDef(ast.stmt):
    name: str
    values: list[ast.expr]

class UnionDef(ast.stmt):
    __match_args__ = ("name", "classes")
    name: str
    classes: list[ast.ClassDef]

class Py2Freezed(ast.NodeVisitor):
    def __init__(self):
        self.nodes = []

    def parse(self, data: str):
        node = ast.parse(data)

        node = Factory2Constant().visit(node)
        ast.fix_missing_locations(node)

        node = Default2Constant().visit(node)
        ast.fix_missing_locations(node)

        node = Union2Class().visit(node)
        ast.fix_missing_locations(node)

        node = Class2Enum().visit(node)
        ast.fix_missing_locations(node)

        return self.visit(node)

    def visit_ClassDef(self, node: ast.ClassDef):
        self.nodes.append(Py2FreezedClass(node))

    def visit_EnumDef(self, node: EnumDef):
        self.nodes.append(Py2FreezedEnum(node))

    def visit_UnionDef(self, node: UnionDef):
        self.nodes.append(Py2FreezedUnion(node))

    def to_freezed(self):
        return "".join(str(node) for node in self.nodes)

# translates classes inherited from "Enum" to enum defs
class Class2Enum(ast.NodeTransformer):
    class EnumScanner(ast.NodeVisitor):
        def __init__(self):
            self.values = []

        def visit_Assign(self, node: ast.Assign):
            self.values.extend(node.targets)

    def visit_ClassDef(self, node: ast.ClassDef):
        if any(base.value.id == "enum" for base in node.bases):
            scanner = self.EnumScanner()
            scanner.visit(node)
            return EnumDef(name=node.name, values=scanner.values)
        return self.generic_visit(node)

# translates "attr.factory(list)" to "[]" for easier processing
class Factory2Constant(ast.NodeTransformer):
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
            isinstance(node.args[0], ast.Name):
                if node.args[0].id == "list":
                    return ast.Constant(value=[])
        return self.generic_visit(node)

# translates "attr.ib(default=foo)" to "foo" for easier processing
class Default2Constant(ast.NodeTransformer):
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

# translates "Union[A, B]" to union class defs
class Union2Class(ast.NodeTransformer):
    class UnionScanner(ast.NodeTransformer):
        def __init__(self):
            self.named = {}
            self.unnamed = []

        # Assign(
        #   targets=[Name(id='AnyStep', ctx=Store())],
        #   value=Subscript(
        #     value=Name(id='Union', ctx=Load()),
        #     slice=Tuple(elts=[
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

        def visit_Subscript(self, node: ast.Subscript):
            if isinstance(node.value, ast.Name) and node.value.id == "Union":
                names = [e.id for e in node.slice.elts if isinstance(e, ast.Name)]
                self.unnamed.append(names)
                return ast.Name('Or'.join(names))
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
                k = 'Or'.join(v)
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

# translates a Python class to a Freezed Dart class
class Py2FreezedClass(ast.NodeVisitor):
    def __init__(self, node: ast.ClassDef):
        self.name = node.name
        self.properties = []
        self.visit(node)

    def visit_AnnAssign(self, node: ast.AnnAssign):
        self.properties.append(Py2FreezedProperty(node))

    def __str__(self):
        annotations = "@JsonMapConverter()\n  " if any(property.type.startswith("Map<int,") for property in self.properties) else ""
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
        "datetime": "DateTime",
        "dict": "Map<String, dynamic>",
        "list": "List<dynamic>",
        "str": "String",
    }.get(type, type)

# returns the respective Dart value for a Python value
def dart_value(node: ast.AST):
    if not isinstance(node, ast.Constant):
        return None
    if isinstance(node.value, bool):
        return str(node.value).lower()
    if isinstance(node.value, str):
        return f"'{node.value}'"
    if node.value == None:
        return "null"
    return str(node.value)

# translates a Python property to a Freezed property
class Py2FreezedProperty(ast.NodeVisitor):
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
        if self.value == None:
            property = f"required {property}"
        if name != camel_case(self.name):
             property = f"@JsonKey(name: '{self.name}') {property}"
        if self.value != None and self.value != "null":
            property = f"@Default({self.value}) {property}"
        return f"{property},"

# translates a Python union to a Freezed union
class Py2FreezedUnion(ast.NodeVisitor):
    def __init__(self, node: UnionDef):
        self.name = node.name
        self.classes = [Py2FreezedClass(c) for c in node.classes]

    def _format(self, cls: Py2FreezedClass):
        annotations = "@JsonMapConverter()\n  " if any(property.type.startswith("Map<int,") for property in cls.properties) else ""
        properties = "\n    ".join(str(property) for property in cls.properties)
        return f"""
  @FreezedUnionValue('{cls.name}')
  {annotations}const factory {self.name}.{dart_name(cls.name)}({{
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

# translates a Python enum to a Dart enum
class Py2FreezedEnum:
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

    if not input.endswith(".py") or (output != None and not output.endswith(".dart")):
        print("usage: py2freezed <input.py> (<output.dart>)")
        return

    py2freezed = Py2Freezed()
    with open(sys.argv[1], "r") as file:
        py2freezed.parse(file.read())

    data = py2freezed.to_freezed()
    if output == None:
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
