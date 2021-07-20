import 'package:pwquality/pwquality.dart';
import 'package:test/test.dart';

void main() {
  test('min length', () {
    final pwq = PwQuality();
    expect(pwq.initialize(), isTrue);

    // pwqprivate.h: #define PWQ_DEFAULT_MIN_LENGTH 8
    expect(pwq.minLength, equals(8));

    // pwqprivate.h: #define PWQ_BASE_MIN_LENGTH 6
    pwq.minLength = 4;
    expect(pwq.minLength, equals(6));

    pwq.minLength = 123;
    expect(pwq.minLength, equals(123));

    pwq.dispose();
  });

  test('quality', () {
    final pwq = PwQuality();
    expect(pwq.initialize(), isTrue);

    pwq.minLength = 6;

    expect(pwq.qualityCheck('4N9eqB'), 30);
    expect(pwq.qualityCheck('4N9eqBF'), 50);
    expect(pwq.qualityCheck('4N9eqBFx'), 69);
    expect(pwq.qualityCheck('4N9eqBFxE'), 88);
    expect(pwq.qualityCheck('4N9eqBFxEp'), 100);

    pwq.dispose();
  });

  test('errors', () {
    final pwq = PwQuality();
    expect(pwq.initialize(), isTrue);

    expectLater(() => pwq.qualityCheck(''),
        throwsA(equals(PwQualityException(PwQualityError.emptyPassword))));

    expectLater(() => pwq.qualityCheck('abcd'),
        throwsA(equals(PwQualityException(PwQualityError.minLength))));

    expectLater(() => pwq.qualityCheck('abba'),
        throwsA(equals(PwQualityException(PwQualityError.palindrome))));

    expectLater(() => pwq.qualityCheck('password'),
        throwsA(equals(PwQualityException(PwQualityError.cracklibCheck))));

    pwq.dispose();
  });

  test('generate', () {
    final pwq = PwQuality();
    expect(pwq.initialize(), isTrue);

    expect(pwq.generate(), isNotEmpty);

    pwq.dispose();
  });
}
