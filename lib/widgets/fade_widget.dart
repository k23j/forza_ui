import 'dart:ui';

import 'package:flutter/material.dart';

class FadeWidget extends StatelessWidget {
  FadeWidget({
    this.child,
    this.duration = const Duration(seconds: 1),
    this.delay,
    this.offset,
    super.key,
  });

  final Widget? child;

  final Duration duration;
  final Duration? delay;
  final Offset? offset;

  final Tween<double> _tween = Tween<double>(begin: .0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay ?? Duration.zero),
      builder:
          (context, snapshot) => TweenAnimationBuilder<double>(
            tween:
                snapshot.connectionState == ConnectionState.done
                    ? _tween
                    : Tween(begin: 0, end: 0),
            curve: Curves.easeInOut,
            duration: duration,
            builder:
                (context, value, child) => Opacity(
                  opacity: value,
                  child:
                      offset == null
                          ? child
                          : Transform.translate(
                            offset: Offset.lerp(offset, Offset.zero, value)!,
                            child: child,
                          ),
                ),
            child: child,
          ),
    );
  }
}
