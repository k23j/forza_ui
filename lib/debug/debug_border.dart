import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_options.dart';

class DebugBorder extends StatelessWidget {
  const DebugBorder({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DebugOptions.instance.bShowDebugBorder,
      builder:
          (context, value, child) => Container(
            decoration:
                value
                    ? BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    )
                    : null,
            child: child,
          ),
      child: child,
    );
  }
}
