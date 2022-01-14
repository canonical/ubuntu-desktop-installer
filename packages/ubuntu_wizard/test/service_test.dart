import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/services.dart';

class Service extends Object {}

void main() {
  tearDown(() => unregisterMockService<Service>());

  test('unknown service', () {
    expect(() => getService<Service>(), throwsAssertionError);
  });

  test('re-register service', () {
    expect(() => registerService(Service.new), isNot(throwsAssertionError));
    expect(() => registerService(Service.new), throwsAssertionError);
  });

  test('re-register service instance', () {
    final service = Service();
    expect(() => registerServiceInstance(service), isNot(throwsAssertionError));
    expect(() => registerServiceInstance(service), throwsAssertionError);
  });

  test('locate service', () {
    registerService(Service.new);
    expect(getService<Service>(), isNotNull);
  });

  test('locate service instance', () {
    final service = Service();
    registerServiceInstance(service);
    expect(getService<Service>(), equals(service));
  });

  test('mock service', () {
    final mock1 = Service();
    final mock2 = Service();
    expect(mock1, isNot(equals(mock2)));

    registerMockService(mock1);
    expect(getService<Service>(), equals(mock1));

    registerMockService(mock2);
    expect(getService<Service>(), equals(mock2));
  });
}
