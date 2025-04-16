import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forza_ui/debug/debug_border.dart';

class ForzaCircularProgressIndicator extends StatelessWidget {
  const ForzaCircularProgressIndicator({super.key});

  final double size = 256;
  final int pointerQnt = 8;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pointers = List.generate(
      pointerQnt,
      (index) => Transform.rotate(
        angle: 2 * pi * index / pointerQnt,
        child: Transform.translate(
          offset: Offset(0, 90),
          child: Container(width: 10, height: 60, color: Colors.red),
        ),
      ),
    );

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 2 * pi),

      duration: Duration(seconds: 5),
      builder:
          (context, value, child) =>
              Transform.rotate(angle: value, child: child),
      child: DebugBorder(
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(alignment: Alignment.center, children: pointers),
        ),
      ),
    );
  }
}
