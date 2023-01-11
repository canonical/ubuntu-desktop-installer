import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

part 'refresh_service.freezed.dart';

/// @internal
final log = Logger('refresh');

@freezed
class RefreshState with _$RefreshState {
  const RefreshState._();
  const factory RefreshState.checking() = _RefreshChecking;
  const factory RefreshState.status(RefreshStatus status) = _RefreshStatus;
  const factory RefreshState.progress(Change change) = _RefreshProgress;
  const factory RefreshState.done() = _RefreshDone;
  const factory RefreshState.error([Object? error]) = _RefreshError;

  bool get available => maybeWhen(
      status: (s) => s.availability == RefreshCheckState.AVAILABLE,
      orElse: () => false);
  bool get busy => maybeWhen(progress: (c) => !c.ready, orElse: () => false);
  bool get ready => maybeWhen(
      progress: (c) => c.ready, done: () => true, orElse: () => false);
}

class RefreshService {
  RefreshService(this._client);

  final SubiquityClient _client;

  var _state = const RefreshState.checking();
  final _controller = StreamController<RefreshState>.broadcast();

  RefreshState get state => _state;
  Stream<RefreshState> get stateChanged => _controller.stream;

  void _setState(RefreshState state) {
    if (_state == state) return;
    log.debug(state);
    _state = state;
    _controller.add(state);
  }

  void _setStatus(RefreshStatus status) {
    _setState(RefreshState.status(status));
  }

  void _setProgress(Change change) {
    _setState(RefreshState.progress(change));
  }

  Future<RefreshState> check() async {
    try {
      _setState(const RefreshState.checking());
      _setStatus(await _client.checkRefresh(wait: true));
    } catch (e) {
      _setState(RefreshState.error(e));
    }
    return _state;
  }

  Future<void> refresh() async {
    final id = await _client.startRefresh();
    await Future.doWhile(() async {
      try {
        _setProgress(await _client.getRefreshProgress(id));
        if (_state.ready) {
          _setState(const RefreshState.done());
        }
      } catch (e) {
        // subiquity restarted, consider the refresh done
        _setState(const RefreshState.done());
        return false;
      }
      await Future.delayed(const Duration(seconds: 1));
      return !_state.ready;
    });
  }

  Future<void> close() => _controller.close();
}
