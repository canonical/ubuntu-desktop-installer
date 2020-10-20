import 'package:flutter_test/flutter_test.dart';

import 'package:subiquity_client/subiquity_client.dart';

void main() {
  test('adds one to input value', () {
    final client = SubiquityClient();
    expect(client.test(2), 3);
    expect(client.test(-7), -6);
    expect(client.test(0), 1);
    expect(() => client.test(null), throwsNoSuchMethodError);
  });
}
