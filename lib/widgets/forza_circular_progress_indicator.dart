import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:forza_ui/debug/debug_border.dart';

class ForzaCircularProgressIndicator extends StatefulWidget {
  const ForzaCircularProgressIndicator({this.size = 128, super.key});

  final double size;

  @override
  State<ForzaCircularProgressIndicator> createState() =>
      _ForzaCircularProgressIndicatorState();
}

class _ForzaCircularProgressIndicatorState
    extends State<ForzaCircularProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _speedModController;

  final double size = 256;
  final int pointerQnt = 8;

  final Duration _speedModDuration = const Duration(seconds: 6);

  final double secondsPerRotation = 2;

  final double minSpeedMod = 1.75;
  final double maxSpeedMod = 3;

  double _currentSpeedModAlpha = 0;
  late double _targetSpeedMod;
  Duration _totalElapsed = Duration.zero;
  double _totalAngle = 0;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    Ticker rotationTicker = Ticker(onRotationTick);

    rotationTicker.start();

    _speedModController = AnimationController(
      duration: _speedModDuration,
      vsync: this,
    )..addListener(() {
      setState(() {
        _currentSpeedModAlpha = _calculateSpeedMod(_speedModController.value);
      });
    });

    scheduleAcceleration(randomIntervalInRange(min: 3000, max: 6000));
  }

  void onRotationTick(Duration elapsed) {
    Duration delta = elapsed - _totalElapsed;
    _totalElapsed = elapsed;
    double angleDelta =
        (delta.inMilliseconds / (secondsPerRotation * 1000)) * 2 * pi;

    setState(() {
      _totalAngle +=
          angleDelta * lerpDouble(1, _targetSpeedMod, _currentSpeedModAlpha)!;
    });
  }

  void scheduleAcceleration(Duration interval) async {
    setTargetSpeedMod();
    await Future.delayed(interval);

    setState(() {
      _speedModController.reset();
      _speedModController.forward();
    });

    scheduleAcceleration(randomIntervalInRange(max: 3000) + _speedModDuration);
  }

  //Milliseconds
  Duration randomIntervalInRange({int min = 0, required int max}) {
    int result = _random.nextInt(max) + min;
    return Duration(milliseconds: result);
  }

  double _calculateSpeedMod(double t) {
    double accelDurationPercentage = .3;
    assert(accelDurationPercentage <= .5);

    if (t < accelDurationPercentage) {
      return Curves.easeInOut.transform(
        t * (1 / accelDurationPercentage),
      ); // 0→1
    }
    if (t > 1 - accelDurationPercentage) {
      return Curves.easeInOut.transform(
        (1 - t) * (1 / accelDurationPercentage),
      ); // 1→0
    }
    return 1.0; // Plateau
  }

  void setTargetSpeedMod() {
    double alpha = _random.nextDouble();
    _targetSpeedMod = lerpDouble(minSpeedMod, maxSpeedMod, alpha)!;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pointers = List.generate(
      pointerQnt,
      (index) => Transform.rotate(
        angle: 2 * pi * index / pointerQnt,
        child: Transform.translate(
          offset: Offset(0, 75),
          child: Container(width: 10, height: 50, color: Colors.white),
        ),
      ),
    );

    return Transform.rotate(
      angle: _totalAngle,
      // angle: effectiveAngle,
      child: DebugBorder(
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: size,
              height: size,
              child: Stack(alignment: Alignment.center, children: pointers),
            ),
          ),
        ),
      ),
    );
  }
}
