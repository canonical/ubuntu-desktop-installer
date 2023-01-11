import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stdlibc/stdlibc.dart';

import '../../services.dart';

class RefreshModel extends ChangeNotifier {
  RefreshModel(this._service);

  final RefreshService _service;
  StreamSubscription<RefreshState>? _stateChanged;

  RefreshState get state => _service.state;

  Future<void> init() async {
    _stateChanged = _service.stateChanged.listen((_) => notifyListeners());
    await _service.check();
  }

  @override
  void dispose() async {
    await _stateChanged?.cancel();
    _stateChanged = null;
    super.dispose();
  }

  Future<RefreshState> check() => _service.check();
  Future<void> refresh() => _service.refresh();

  Future<void> restart() async {
    execv(Platform.resolvedExecutable, []);
  }
}
