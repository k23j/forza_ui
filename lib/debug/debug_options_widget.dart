import 'package:flutter/material.dart';
import 'package:forza_ui/debug/buttons/toggle_debug_borders_button.dart';
import 'package:forza_ui/debug/buttons/toggle_debug_variable_names.dart';

class DebugOptionsWidget extends StatelessWidget {
  const DebugOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [ToggleDebugBordersButton(), ToggleDebugVariableNamesButton()],
    );
  }
}
