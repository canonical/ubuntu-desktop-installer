import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

const Matcher isWeak = PasswordStrengthMatcher(PasswordStrength.weak);
const Matcher isFair = PasswordStrengthMatcher(PasswordStrength.fair);
const Matcher isGood = PasswordStrengthMatcher(PasswordStrength.good);
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
    expect(estimatePasswordStrength('p@sswd'), isWeak);

    // 8
    expect(estimatePasswordStrength('password'), isWeak);
    expect(estimatePasswordStrength('Password'), isWeak);
    expect(estimatePasswordStrength('p4ssword'), isWeak);
    expect(estimatePasswordStrength('P4ssword'), isFair);
    expect(estimatePasswordStrength('p@ssw0rd'), isFair);
    expect(estimatePasswordStrength('P@ssw0rd'), isFair);
    expect(estimatePasswordStrength('P@ssw0rD'), isFair);

    // 9
    expect(estimatePasswordStrength('passsword'), isWeak);
    expect(estimatePasswordStrength('p4sssword'), isWeak);
    expect(estimatePasswordStrength('P4sssword'), isFair);
    expect(estimatePasswordStrength('p@sssword'), isGood);
    expect(estimatePasswordStrength('P@sssword'), isGood);
    expect(estimatePasswordStrength('p@sssw0rd'), isGood);
    expect(estimatePasswordStrength('P@sssw0rd'), isGood);
    expect(estimatePasswordStrength('P@555w0rD'), isGood);

    expect(estimatePasswordStrength('321Dr0w55@P'), isStrong);
    expect(estimatePasswordStrength('y42JU%#agK%kj64'), isStrong);
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
