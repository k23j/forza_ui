import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forza_ui/debug/debug_border.dart';
import 'package:forza_ui/debug/debug_variable_widget.dart';
import 'package:forza_ui/screens/intro_screen/intro_menu_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
                        child: FittedBox(
                          // fit: BoxFit.scaleDown,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/forza-motorsport-logo.svg',
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width * .16,
                              ),

                              SizedBox(height: 32),

                              Column(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntroMenuButton(
                                    icon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/Return-left-02.svg',
                                        width: 36,
                                        // fit: BoxFit.fitWidth,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: 'PLAY',
                                  ),
                                  SizedBox(height: 12),
                                  IntroMenuButton(
                                    icon: Text(
                                      'F',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      ),
                                    ),
                                    title: 'ACCESSIBILITY/SETTINGS',
                                  ),
                                ],
                              ),
                            ],
                          ),
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
