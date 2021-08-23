import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

const Matcher isWeak = PasswordStrengthMatcher(PasswordStrength.weak);
const Matcher isModerate = PasswordStrengthMatcher(PasswordStrength.moderate);
const Matcher isStrong = PasswordStrengthMatcher(PasswordStrength.strong);

void main() {
  test('estimate password strength', () {
    expect(estimatePasswordStrength(''), isWeak);
    expect(estimatePasswordStrength('p'), isWeak);

    // 2
    expect(estimatePasswordStrength('pw'), isWeak);
    expect(estimatePasswordStrength('p4'), isWeak);
    expect(estimatePasswordStrength('p@'), isWeak);

    // 6
    expect(estimatePasswordStrength('passwd'), isWeak);
    expect(estimatePasswordStrength('p4sswd'), isWeak);
    expect(estimatePasswordStrength('p@sswd'), isModerate);

    // 8
    expect(estimatePasswordStrength('password'), isWeak);
    expect(estimatePasswordStrength('Password'), isWeak);
    expect(estimatePasswordStrength('p4ssword'), isModerate);
    expect(estimatePasswordStrength('P4ssword'), isModerate);
    expect(estimatePasswordStrength('p@ssw0rd'), isModerate);
    expect(estimatePasswordStrength('P@ssw0rd'), isModerate);

    // 9
    expect(estimatePasswordStrength('passsword'), isWeak);
    expect(estimatePasswordStrength('p4sssword'), isModerate);
    expect(estimatePasswordStrength('P4sssword'), isModerate);
    expect(estimatePasswordStrength('p@sssword'), isStrong);
    expect(estimatePasswordStrength('P@sssword'), isStrong);
    expect(estimatePasswordStrength('p@sssw0rd'), isStrong);
    expect(estimatePasswordStrength('P@sssw0rd'), isStrong);
  });

  test('encrypt password', () {
    expect(
      encryptPassword('password', salt: 'ubuntu', algorithm: Hash.sha256),
      equals(r'$5$ubuntu$YyN7YehmI5vzEPMEsNzZZbjGvKHoFVARPrxMDTOh2Z4'),
    );
    expect(
      encryptPassword('password', salt: 'ubuntu', algorithm: Hash.sha512),
      equals(
          r'$6$ubuntu$DbqFEgVZJVTVBu4DPppmD87hRcZE5LU8D1/udu5hEMy80ngeaQKaQEgTwYaGtG3ewX7fnjOhyvgvlAiKH4D6K1'),
    );
  });
}

class PasswordStrengthMatcher extends Matcher {
  const PasswordStrengthMatcher(this.strength);

  final PasswordStrength strength;

  @override
  bool matches(dynamic item, Map matchState) => item == strength;

  @override
  Description describe(Description description) =>
      description.add(strength.toString());
}
