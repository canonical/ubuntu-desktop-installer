import unittest
from py2freezed import Py2Freezed

class TestPy2Freezed(unittest.TestCase):
    def test_enum(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestEnum(enum.Enum):
    FOO = enum.auto()
    BAR = enum.auto()
    BAZ = enum.auto()

class TestEnum2(enum.Enum):
    QUX = _("qux")
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    boolean: bool
    integer: int
    string: str
    foo: Foo
""")
        self.assertEqual(py2freezed.to_freezed(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required bool boolean,
    required int integer,
    required String string,
    required Foo foo,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_optional(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    boolean: Optional[bool]
    integer: Optional[int]
    string: Optional[str]
    foo: Optional[Foo]
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    boolean: bool = False
    integer: int = 1
    string: str = "foo"
""")
        self.assertEqual(py2freezed.to_freezed(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    @Default(false) bool boolean,
    @Default(1) int integer,
    @Default('foo') String string,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_attr(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
@attr.s(auto_attribs=True)
class TestClass:
    foo: int = attr.ib(default=123, repr=False)
    bar: str = attr.ib(default='foo', repr=False)
    baz: List[str] = attr.Factory(list)
    qux: List[str] = attr.ib(default=attr.Factory(list))
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    foo_bar: bool = False
""")
        self.assertEqual(py2freezed.to_freezed(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    @Default(false) bool fooBar,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_named_union(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class Foo:
    a: bool
    b: int = 1

class Bar:
    c: Optional[str]

class BazQux:
    d: Test

TestUnion = Union[Foo, Bar, BazQux]
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class Foo:
    a: bool

class BarBaz:
    b: bool

class TestClass:
    foo: Union[Foo, BarBaz]
""")
        self.assertEqual(py2freezed.to_freezed(), """
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

    def test_datetime(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    foo_bar: datetime.datetime = attr.ib(metadata={'time_fmt': '%Y-%m-%dT%H:%M:%S.%fZ'})
""")
        self.assertEqual(py2freezed.to_freezed(), """
@freezed
class TestClass with _$TestClass {
  const factory TestClass({
    required DateTime fooBar,
  }) = _TestClass;

  factory TestClass.fromJson(Map<String, dynamic> json) => _$TestClassFromJson(json);
}
""")

    def test_intmap_json_converter(self):
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class TestClass:
    foo: Dict[int, int]
    bar: Dict[int, str]
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
        py2freezed = Py2Freezed()
        py2freezed.parse("""
class Foo:
    a: Dict[int, int]

class Bar:
    b: Dict[int, str]

TestUnion = Union[Foo, Bar]
""")
        self.assertEqual(py2freezed.to_freezed(), """
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
