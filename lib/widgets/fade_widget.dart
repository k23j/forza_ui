// import 'dart:ui';

import 'package:flutter/material.dart';

enum FadeAnimState { play, reverse, held, done }

class FadeWidget extends StatelessWidget {
  const FadeWidget({
    this.child,
    this.state = FadeAnimState.play,
    this.duration = const Duration(seconds: 1),
    this.delay,
    this.offset,
    super.key,
  });

  final Widget? child;

  final FadeAnimState state;

  final Duration duration;
  final Duration? delay;
  final Offset? offset;

  // final Tween<double> _tween = Tween<double>(begin: .0, end: 1.0);

  Tween<double> getTween(ConnectionState connectionState) {
    if (state == FadeAnimState.held ||
        connectionState != ConnectionState.done) {
      return Tween(begin: 0, end: 0);
    }

    if (state == FadeAnimState.done) {
      return Tween(begin: 1, end: 1);
    }

    if (state == FadeAnimState.reverse) {
      return Tween(begin: 1, end: 0);
    }

    return Tween(begin: .0, end: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay ?? Duration.zero),
      builder:
          (context, snapshot) => TweenAnimationBuilder<double>(
            tween: getTween(snapshot.connectionState),
            curve: Curves.easeInOut,
            duration: state == FadeAnimState.done ? Duration.zero : duration,
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
