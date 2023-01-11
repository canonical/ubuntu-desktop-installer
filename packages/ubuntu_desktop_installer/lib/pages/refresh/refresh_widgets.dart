import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../l10n.dart';
import 'refresh_l10n.dart';

String get snapName =>
    Platform.environment['SNAP_NAME'] ??
    p.basename(Platform.resolvedExecutable);

class _RefreshAvatar extends StatelessWidget {
  const _RefreshAvatar({required this.progress});

  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, bottom: 32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffe5e5e5),
                width: 8,
              ),
            ),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                'assets/refresh/logo.png',
              ),
            ),
          ),
          if (progress != null && progress! > 0 && progress! < 1)
            Positioned(
              child: Text(
                '${(progress! * 100).ceil()}%',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          Positioned.fill(
            top: 3.75,
            left: 3.75,
            right: 3.75,
            bottom: 3.75,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8.5,
            ),
          ),
        ],
      ),
    );
  }
}

class RefreshCheckingView extends StatelessWidget {
  const RefreshCheckingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _RefreshAvatar(progress: null),
      ],
    );
  }
}

class RefreshStatusView extends StatelessWidget {
  const RefreshStatusView({
    super.key,
    required this.status,
    this.onRefresh,
  });

  final RefreshStatus status;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Column(
      children: [
        const _RefreshAvatar(progress: 0),
        Text(status.availability == RefreshCheckState.AVAILABLE
            ? lang.refreshCurrent(snapName, status.currentSnapVersion)
            : lang.refreshUpToDate(status.currentSnapVersion)),
        const SizedBox(height: kContentSpacing),
        if (status.availability == RefreshCheckState.AVAILABLE)
          ElevatedButton(
            onPressed: onRefresh,
            child: Text(lang.refreshInstall(status.newSnapVersion)),
          ),
      ],
    );
  }
}

class RefreshProgressView extends StatelessWidget {
  const RefreshProgressView({super.key, required this.change});

  final Change change;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final task = change.tasks
        .firstWhereOrNull((task) => task.status == TaskStatus.DOING);
    return Column(
      children: [
        _RefreshAvatar(
            progress: task != null && task.progress.total > 1
                ? task.progress.done / task.progress.total
                : null),
        Text(task?.localize(context, snapName) ??
            lang.refreshUpdating(snapName)),
      ],
    );
  }
}

class RefreshRestartView extends StatelessWidget {
  const RefreshRestartView({super.key, this.error});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Column(
      children: [
        const _RefreshAvatar(progress: 0),
        Text(error?.toString() ?? lang.refreshRestart),
      ],
    );
  }
}
