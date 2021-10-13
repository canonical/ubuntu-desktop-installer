import 'dart:async';

import 'package:flutter/material.dart';

/// Views a stream of log lines.
class LogView extends StatefulWidget {
  /// Creates a log view. A stream of [log] lines is required.
  const LogView({
    Key? key,
    required this.log,
    this.maxLines,
    this.padding,
    this.decoration,
    this.background,
    this.style,
  }) : super(key: key);

  /// The stream of log lines to show.
  final Stream<String> log;

  /// See [TextField.maxLines]
  final int? maxLines;

  /// Padding around the log text.
  final EdgeInsetsGeometry? padding;

  /// See [TextField.decoration]
  final InputDecoration? decoration;

  /// See [Container.decoration]
  final Decoration? background;

  /// See [TextField.style]
  final TextStyle? style;

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  StreamSubscription<String>? _subscription;
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _subscription = widget.log.listen(_appendLine);
    _scrollToEnd();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _appendText(String line) {
    final text = _controller.text;
    if (text.isEmpty) return line;
    return '$text\n$line';
  }

  void _appendLine(String line) {
    final wasAtEnd = _isAtEnd();

    final text = _appendText(line);
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );

    if (wasAtEnd) _scrollToEnd();
  }

  bool _isAtEnd() => _scrollController.position.extentAfter == 0;
  void _scrollToEnd() {
    if (!mounted) return;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void didUpdateWidget(LogView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToEnd();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: widget.background,
      child: TextField(
        controller: _controller,
        decoration: widget.decoration,
        maxLines: widget.maxLines,
        readOnly: true,
        scrollController: _scrollController,
        style: widget.style,
      ),
    );
  }
}
