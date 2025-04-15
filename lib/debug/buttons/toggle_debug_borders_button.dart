import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_options.dart';

class ToggleDebugBordersButton extends StatelessWidget {
  const ToggleDebugBordersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Text('Show debug borders'),
          ValueListenableBuilder<bool>(
            valueListenable: DebugOptions.instance.bShowDebugBorder,
            builder:
                (context, value, child) => Checkbox(
                  value: value,
                  onChanged:
                      (value) => DebugOptions.instance.toggleDebugBorder(),
                ),
          ),
        ],
      ),
    );
  }
}
