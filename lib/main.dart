import 'package:flutter/material.dart';
import 'package:forza_ui/appearance/custom_theme.dart';
import 'package:forza_ui/background_widget.dart';
import 'package:forza_ui/data/cars/huracan.dart';
import 'package:forza_ui/debug/debug_options_widget.dart';
import 'package:forza_ui/init_app.dart';
import 'package:forza_ui/screens/intro_screen.dart';
import 'package:forza_ui/screens/loading_screen.dart';

void main() {
  // initApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLoading = true;

  @override
  void initState() {
    loadApp();
    super.initState();
  }

  void loadApp() async {
    await Future.wait([initApp(), Future.delayed(Duration(seconds: 5))]);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child:
                  _isLoading
                      ? LoadingScreen()
                      : BackgroundWidget(car: carHuracan),
            ),
          ),
          // BackgroundWidget(car: carHuracan),
          Material(
            color: Colors.transparent,
            child: IntroScreen(isLoaded: !_isLoading),
          ),
          Positioned(top: 16, right: 16, child: DebugOptionsWidget()),
        ],
      ),
    );
  }
}
