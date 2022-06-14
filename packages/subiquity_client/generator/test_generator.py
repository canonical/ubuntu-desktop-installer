import unittest
from generator import Generator

# python -m unittest test_generator.py

class TestGenerator(unittest.TestCase):
    def test_enum(self):
        generator = Generator()
        generator.parse("""
class TestEnum(enum.Enum):
    FOO = enum.auto()
    BAR = enum.auto()
    BAZ = enum.auto()

class TestEnum2(enum.Enum):
    QUX = _("qux")
""")
        self.assertEqual(generator.to_dart(), """
enum TestEnum {
  FOO,
  BAR,
  BAZ,
}

enum TestEnum2 {
  QUX,
}
""")

    def test_basic(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    boolean: bool
    integer: int
    string: str
    foo: Foo
    any: Any
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required bool boolean,
    required int integer,
    required String string,
    required Foo foo,
    required dynamic any,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_optional(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    boolean: Optional[bool]
    integer: Optional[int]
    string: Optional[str]
    foo: Optional[Foo]
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required bool? boolean,
    required int? integer,
    required String? string,
    required Foo? foo,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_default(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    boolean: bool = False
    integer: int = 1
    string: str = "foo"
    optional: Optional[int] = -1
    any: Any = None
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    @Default(false) bool boolean,
    @Default(1) int integer,
    @Default('foo') String string,
    @Default(-1) int? optional,
    dynamic any,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_attr(self):
        generator = Generator()
        generator.parse("""
@attr.s(auto_attribs=True)
class TestClass:
    foo: int = attr.ib(default=123, repr=False)
    bar: str = attr.ib(default='foo', repr=False)
    baz: List[str] = attr.Factory(list)
    qux: List[str] = attr.ib(default=attr.Factory(list))
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    @Default(123) int foo,
    @Default('foo') String bar,
    @Default([]) List<String> baz,
    @Default([]) List<String> qux,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_camel(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    foo_bar: bool = False
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    @Default(false) bool fooBar,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_named_union(self):
        generator = Generator()
        generator.parse("""
class Foo:
    a: bool
    b: int = 1

class Bar:
    c: Optional[str]

class BazQux:
    d: Test

TestUnion = Union[Foo, Bar, BazQux]
""")
        self.assertEqual(generator.to_dart(), """
@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class TestUnion with _$TestUnion {

  @FreezedUnionValue('Foo')
  const factory TestUnion.foo({
    required bool a,
    @Default(1) int b,
  }) = Foo;

  @FreezedUnionValue('Bar')
  const factory TestUnion.bar({
    required String? c,
  }) = Bar;

  @FreezedUnionValue('BazQux')
  const factory TestUnion.bazQux({
    required Test d,
  }) = BazQux;

  factory TestUnion.fromJson(Map<String, dynamic> json) => _$TestUnionFromJson(json);
}
""")

    def test_unnamed_union(self):
        generator = Generator()
        generator.parse("""
class Foo:
    a: bool

class BarBaz:
    b: bool

class TestClass:
    foo: Union[Foo, BarBaz]
""")
        self.assertEqual(generator.to_dart(), """
@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class FooOrBarBaz with _$FooOrBarBaz {

  @FreezedUnionValue('Foo')
  const factory FooOrBarBaz.foo({
    required bool a,
  }) = Foo;

  @FreezedUnionValue('BarBaz')
  const factory FooOrBarBaz.barBaz({
    required bool b,
  }) = BarBaz;

  factory FooOrBarBaz.fromJson(Map<String, dynamic> json) => _$FooOrBarBazFromJson(json);
}

@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required FooOrBarBaz foo,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_prefixed_union(self):
        generator = Generator()
        generator.parse("""
class TestUnionFoo:
    a: bool

class TestUnionBarBaz:
    b: bool

class TestClass:
    foo: Union[TestUnionFoo, TestUnionBarBaz]
""")
        self.assertEqual(generator.to_dart(), """
@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class TestUnion with _$TestUnion {

  @FreezedUnionValue('TestUnionFoo')
  const factory TestUnion.foo({
    required bool a,
  }) = TestUnionFoo;

  @FreezedUnionValue('TestUnionBarBaz')
  const factory TestUnion.barBaz({
    required bool b,
  }) = TestUnionBarBaz;

  factory TestUnion.fromJson(Map<String, dynamic> json) => _$TestUnionFromJson(json);
}

@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required TestUnion foo,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_datetime(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    foo_bar: datetime.datetime = attr.ib(metadata={'time_fmt': '%Y-%m-%dT%H:%M:%S.%fZ'})
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required DateTime fooBar,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_intmap_json_converter(self):
        generator = Generator()
        generator.parse("""
class TestClass:
    foo: Dict[int, int]
    bar: Dict[int, str]
""")
        self.assertEqual(generator.to_dart(), """
@freezed
class TestClass with _$TestClass {
  @JsonMapConverter()
  const factory TestClass({
    required Map<int, int> foo,
    required Map<int, String> bar,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_intmap_json_converter(self):
        generator = Generator()
        generator.parse("""
class Foo:
    a: Dict[int, int]

class Bar:
    b: Dict[int, str]

TestUnion = Union[Foo, Bar]
""")
        self.assertEqual(generator.to_dart(), """
@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class TestUnion with _$TestUnion {

  @FreezedUnionValue('Foo')
  @JsonMapConverter()
  const factory TestUnion.foo({
    required Map<int, int> a,
  }) = Foo;

  @FreezedUnionValue('Bar')
  @JsonMapConverter()
  const factory TestUnion.bar({
    required Map<int, String> b,
  }) = Bar;

  factory TestUnion.fromJson(Map<String, dynamic> json) => _$TestUnionFromJson(json);
}
""")


if __name__ == '__main__':
    unittest.main()
