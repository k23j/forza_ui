import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Image.asset(
        'assets/BG/loading_screen_background.jpg',
        // fit: BoxFit.cover,
      ),
    );
  }
}
