import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

void main() {
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
