# Copyright 2021 Canonical, Ltd.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import attr
import random
import string
import typing
import unittest

from subiquity.common.serialize import Serializer


@attr.s(auto_attribs=True)
class Data:
    field1: str
    field2: int

    @staticmethod
    def make_random():
        return Data(
            random.choice(string.ascii_letters),
            random.randint(0, 1000))


@attr.s(auto_attribs=True)
class Container:
    data: Data
    data_list: typing.List[Data]

    @staticmethod
    def make_random():
        return Container(
            data=Data.make_random(),
            data_list=[Data.make_random()
                       for i in range(random.randint(10, 20))])


@attr.s(auto_attribs=True)
class OptionalAndDefault:
    int: int
    optional_int: typing.Optional[int]
    int_default: int = 3
    optional_int_default: typing.Optional[int] = 4


class CommonSerializerTests:

    simple_examples = [
        (int, 1),
        (str, "v"),
        (list, [1]),
        (dict, {"2": 3}),
        (type(None), None),
        ]

    def assertSerializesTo(self, annotation, value, expected):
        self.assertEqual(
            self.serializer.serialize(annotation, value), expected)

    def assertDeserializesTo(self, annotation, value, expected):
        self.assertEqual(
            self.serializer.deserialize(annotation, value), expected)

    def assertRoundtrips(self, annotation, value):
        serialized = self.serializer.to_json(annotation, value)
        self.assertEqual(
            self.serializer.from_json(annotation, serialized), value)

    def assertSerialization(self, annotation, value, expected):
        self.assertSerializesTo(annotation, value, expected)
        self.assertDeserializesTo(annotation, expected, value)

    def test_roundtrip_scalars(self):
        for typ, val in self.simple_examples:
            self.assertRoundtrips(typ, val)

    def test_roundtrip_optional(self):
        self.assertRoundtrips(typing.Optional[int], None)
        self.assertRoundtrips(typing.Optional[int], 1)

    def test_roundtrip_list(self):
        self.assertRoundtrips(typing.List[str], ["a"])
        self.assertRoundtrips(typing.List[int], [23])

    def test_roundtrip_attr(self):
        self.assertRoundtrips(Data, Data.make_random())
        self.assertRoundtrips(Container, Container.make_random())

    def test_scalars(self):
        for typ, val in self.simple_examples:
            self.assertSerialization(typ, val, val)

    def test_non_string_key_dict(self):
        self.assertRaises(
            Exception, self.serializer.serialize, dict, {1: 2})

    def test_roundtrip_dict(self):
        ann = typing.Dict[int, str]
        self.assertRoundtrips(ann, {1: "2"})

    def test_roundtrip_dict_strkey(self):
        ann = typing.Dict[str, int]
        self.assertRoundtrips(ann, {"a": 2})

    def test_serialize_dict(self):
        self.assertSerialization(typing.Dict[int, str], {1: "a"}, [[1, "a"]])

    def test_serialize_dict_strkeys(self):
        self.assertSerialization(typing.Dict[str, str], {"a": "b"}, {"a": "b"})

    def test_rountrip_union(self):
        ann = typing.Union[Data, Container]
        self.assertRoundtrips(ann, Data.make_random())
        self.assertRoundtrips(ann, Container.make_random())


class TestSerializer(CommonSerializerTests, unittest.TestCase):

    serializer = Serializer()

    def test_serialize_attr(self):
        data = Data.make_random()
        expected = {'field1': data.field1, 'field2': data.field2}
        self.assertSerialization(Data, data, expected)

    def test_serialize_container(self):
        data1 = Data.make_random()
        data2 = Data.make_random()
        container = Container(data1, [data2])
        expected = {
            'data': {'field1': data1.field1, 'field2': data1.field2},
            'data_list': [
                {'field1': data2.field1, 'field2': data2.field2},
                ],
            }
        self.assertSerialization(Container, container, expected)

    def test_serialize_union(self):
        data = Data.make_random()
        expected = {
            '$type': 'Data',
            'field1': data.field1,
            'field2': data.field2,
            }
        self.assertSerialization(typing.Union[Data, Container], data, expected)

    def test_arbitrary_types_may_have_type_field(self):
        # The serializer will add a $type field to data elements in a Union.
        # If we then take that serialized value and fling it back to another
        # API entrypoint, one that isn't taking a Union, it must be cool with
        # the excess $type field.
        data = {
            '$type': 'Data',
            'field1': '1',
            'field2': 2,
        }
        expected = Data(field1='1', field2=2)
        self.assertDeserializesTo(Data, data, expected)


class TestCompactSerializer(CommonSerializerTests, unittest.TestCase):

    serializer = Serializer(compact=True)

    def test_serialize_attr(self):
        data = Data.make_random()
        expected = [data.field1, data.field2]
        self.assertSerialization(Data, data, expected)

    def test_serialize_container(self):
        data1 = Data.make_random()
        data2 = Data.make_random()
        container = Container(data1, [data2])
        expected = [
            [data1.field1, data1.field2],
            [[data2.field1, data2.field2]],
            ]
        self.assertSerialization(Container, container, expected)

    def test_serialize_union(self):
        data = Data.make_random()
        expected = ['Data', data.field1, data.field2]
        self.assertSerialization(typing.Union[Data, Container], data, expected)


class TestOptionalAndDefault(CommonSerializerTests, unittest.TestCase):

    serializer = Serializer()

    def test_happy(self):
        data = {
            'int': 11,
            'optional_int': 12,
            'int_default': 3,
            'optional_int_default': 4
        }
        expected = OptionalAndDefault(11, 12)
        self.assertDeserializesTo(OptionalAndDefault, data, expected)

    def test_skip_int(self):
        data = {
            'optional_int': 12,
            'int_default': 13,
            'optional_int_default': 14
        }

        with self.assertRaises(TypeError):
            self.serializer.deserialize(OptionalAndDefault, data)

    def test_skip_optional_int(self):
        data = {
            'int': 11,
            'int_default': 13,
            'optional_int_default': 14
        }

        with self.assertRaises(TypeError):
            self.serializer.deserialize(OptionalAndDefault, data)

    def test_optional_int_none(self):
        data = {
            'int': 11,
            'optional_int': None,
            'int_default': 13,
            'optional_int_default': 14
        }

        expected = OptionalAndDefault(11, None, 13, 14)
        self.assertDeserializesTo(OptionalAndDefault, data, expected)

    def test_skip_int_default(self):
        data = {
            'int': 11,
            'optional_int': 12,
            'optional_int_default': 14
        }

        expected = OptionalAndDefault(11, 12, 3, 14)
        self.assertDeserializesTo(OptionalAndDefault, data, expected)

    def test_skip_optional_int_default(self):
        data = {
            'int': 11,
            'optional_int': 12,
            'int_default': 13,
        }

        expected = OptionalAndDefault(11, 12, 13, 4)
        self.assertDeserializesTo(OptionalAndDefault, data, expected)

    def test_optional_int_default_none(self):
        data = {
            'int': 11,
            'optional_int': 12,
            'int_default': 13,
            'optional_int_default': None,
        }

        expected = OptionalAndDefault(11, 12, 13, None)
        self.assertDeserializesTo(OptionalAndDefault, data, expected)

    def test_extra(self):
        data = {
            'int': 11,
            'optional_int': 12,
            'int_default': 13,
            'optional_int_default': 14,
            'extra': 15
        }

        with self.assertRaises(KeyError):
            self.serializer.deserialize(OptionalAndDefault, data)
