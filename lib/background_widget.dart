import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({required this.pathList, super.key});

  final List<String> pathList;

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  static Random random = Random();
  static const Duration duration = Duration(seconds: 10);
  // static List<
  //   Offset Function({required double offsetValue, required double alpha})
  // >
  // offsetList = [
  //   ({required double offsetValue, required double alpha}) =>
  //       Offset(lerpDouble(offsetValue, offsetValue * -1, alpha)!, 0),
  // ];

  ValueKey<int> _animationCounter = ValueKey<int>(0);

  late List<Image> imageList;

  @override
  void initState() {
    imageList =
        widget.pathList
            .map((path) => Image.asset(path, fit: BoxFit.cover))
            .toList();

    currentOffsetAnimId = getRandomOffsetAnimId();

    super.initState();
  }

  void setNextImage() {
    setState(() {
      currentOffsetAnimId = getRandomOffsetAnimId(currentOffsetAnimId);
      _animationCounter = ValueKey<int>(_animationCounter.value + 1);
    });
  }

  late int currentOffsetAnimId;
  int getRandomOffsetAnimId([int? except]) {
    int offsetAnimQnt = offsetAnimList.length;
    if (offsetAnimQnt == 1) return 0;
    if (except == null) return random.nextInt(offsetAnimQnt);

    int result;
    do {
      result = random.nextInt(offsetAnimQnt);
    } while (result == except);
    return result;
  }

  static const List<(Offset, Offset)> offsetAnimList = [
    (Offset(0, 0), Offset(1, 0)),
    (Offset(1, 0), Offset(0, 0)),
    (Offset(0, 0), Offset(0, 1)),
    (Offset(0, 1), Offset(0, 0)),
  ];

  Offset getOffset({required double offsetValue, required double alpha}) {
    return Offset.lerp(
      offsetAnimList[currentOffsetAnimId].$1 * offsetValue,
      offsetAnimList[currentOffsetAnimId].$2 * offsetValue,
      alpha,
    )!;
  }

  static double calculateOpacity(
    double progress, {
    double fadeDuration = 0.05,
  }) {
    if (progress < fadeDuration) {
      return Curves.easeIn.transform(progress / fadeDuration);
    } else if (progress > 1 - fadeDuration) {
      return Curves.easeOut.transform((1 - progress) / fadeDuration);
    } else {
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              double offsetValue = constraints.maxWidth * .05;
              return TweenAnimationBuilder(
                key: _animationCounter,
                tween: Tween<double>(begin: .0, end: 1.0),
                duration: duration,
                onEnd: setNextImage,
                builder:
                    (context, value, child) => Opacity(
                      opacity: calculateOpacity(value),
                      child: Transform.translate(
                        offset: getOffset(
                          offsetValue: offsetValue,
                          alpha: value,
                        ),
                        child: child,
                      ),
                    ),
                child: Transform.scale(
                  scale: 1.2,
                  child: imageList[_animationCounter.value % imageList.length],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
