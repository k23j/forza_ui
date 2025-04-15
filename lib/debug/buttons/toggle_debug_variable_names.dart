import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_options.dart';

class ToggleDebugVariableNamesButton extends StatelessWidget {
  const ToggleDebugVariableNamesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Text('Show variable names'),
          ValueListenableBuilder<bool>(
            valueListenable: DebugOptions.instance.bShowVariableNames,
            builder:
                (context, value, child) => Checkbox(
                  value: value,
                  onChanged:
                      (value) => DebugOptions.instance.toggleVariableNames(),
                ),
          ),
        ],
      ),
    );
  }
}
