import 'package:flutter/widgets.dart';

class DebugOptions {
  static DebugOptions? _instance;
  static DebugOptions get instance {
    assert(_instance != null);
    return _instance!;
  }

  DebugOptions._();

  factory DebugOptions() {
    if (_instance != null) return instance;

    _instance = DebugOptions._();

    return instance;
  }

  ValueNotifier<bool> bShowDebugBorder = ValueNotifier(false);
  bool toggleDebugBorder() {
    bShowDebugBorder.value = !bShowDebugBorder.value;
    return bShowDebugBorder.value;
  }

  ValueNotifier<bool> bShowVariableNames = ValueNotifier(false);
  bool toggleVariableNames() {
    bShowVariableNames.value = !bShowVariableNames.value;
    return bShowVariableNames.value;
  }
}
