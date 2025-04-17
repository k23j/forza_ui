import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_border.dart';
import 'package:forza_ui/debug/debug_variable_widget.dart';
import 'package:forza_ui/screens/intro_screen/intro_menu_itens.dart';
import 'package:forza_ui/widgets/forza_circular_progress_indicator.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({required this.isLoaded, super.key});

  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
          child: DebugBorder(
            child: SizedBox.expand(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: DebugBorder(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .16,
                          height: MediaQuery.of(context).size.width * .2,
                          child: IntroMenuItens(isLoaded: isLoaded),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: DebugBorder(
                      child: DebugVariableWidget(
                        title: 'gameVersion',
                        data: '1.794.5389.0',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: DebugBorder(
                      child: DebugVariableWidget(
                        title: 'userName',
                        data: 'k23jm',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
