import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_options.dart';

class DebugVariableWidget extends StatelessWidget {
  const DebugVariableWidget({
    required this.title,
    required this.data,
    super.key,
  });

  final String title;
  final String data;

  String get formatedTitle {
    return '{$title}';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DebugOptions.instance.bShowVariableNames,
      builder: (context, value, child) => Text(value ? formatedTitle : data),
    );
  }
}
