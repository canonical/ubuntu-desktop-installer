import 'package:subiquity_client/subiquity_server.dart';
import 'package:test/test.dart';

void main() {
  test('race does not change the result', () async {
    final call1 = getSubiquityPath();
    final call2 = getSubiquityPath();

    expect(await call1, await call2);
  });
  test('race does not change the result 2', () async {
    final call1 = getSocketPath(ServerMode.DRY_RUN);
    final call2 = getSocketPath(ServerMode.DRY_RUN);

    expect(await call1, await call2);
  });
}
