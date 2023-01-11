import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

const checking = RefreshState.checking();
const available = RefreshState.status(RefreshStatus(
  availability: RefreshCheckState.AVAILABLE,
  currentSnapVersion: '1.2.3',
  newSnapVersion: '1.2.4',
));
const unavailable = RefreshState.status(RefreshStatus(
  availability: RefreshCheckState.UNAVAILABLE,
  currentSnapVersion: '1.2.3',
));
const notReady = RefreshState.progress(
  Change(
    id: 'not-ready',
    kind: 'kind',
    summary: 'summary',
    status: TaskStatus.DOING,
    tasks: [
      Task(
        id: 'task-1',
        kind: 'kind',
        summary: 'summary',
        status: TaskStatus.DOING,
        progress: TaskProgress(done: 25, total: 100),
      ),
    ],
    ready: false,
  ),
);
const ready = RefreshState.progress(
  Change(
    id: 'is-ready',
    kind: 'kind',
    summary: 'summary',
    status: TaskStatus.DONE,
    tasks: [],
    ready: true,
  ),
);
const done = RefreshState.done();
final error = RefreshState.error(Exception('err'));

void main() async {
  test('status', () async {
    const checking = RefreshState.checking();
    expect(checking.available, isFalse);
    expect(checking.busy, isFalse);
    expect(checking.ready, isFalse);

    expect(available.available, isTrue);
    expect(available.busy, isFalse);
    expect(available.ready, isFalse);

    expect(notReady.available, isFalse);
    expect(notReady.busy, isTrue);
    expect(notReady.ready, isFalse);

    expect(ready.available, isFalse);
    expect(ready.busy, isFalse);
    expect(ready.ready, isTrue);

    expect(done.available, isFalse);
    expect(done.busy, isFalse);
    expect(done.ready, isTrue);

    expect(error.available, isFalse);
    expect(error.busy, isFalse);
    expect(error.ready, isFalse);
  });
}
