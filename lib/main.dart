import 'package:flutter/material.dart';
import 'package:forza_ui/appearance/custom_theme.dart';
import 'package:forza_ui/background_widget.dart';
import 'package:forza_ui/debug/debug_options_widget.dart';
import 'package:forza_ui/init_app.dart';
import 'package:forza_ui/screens/intro_screen.dart';

void main() {
  initApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          BackgroundWidget(pathList: ['assets/BG1.png']),
          Material(color: Colors.transparent, child: IntroScreen()),
          Positioned(top: 16, right: 16, child: DebugOptionsWidget()),
        ],
      ),
    );
  }
}
