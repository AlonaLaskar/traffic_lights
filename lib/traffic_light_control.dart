import 'package:flutter/material.dart';

import 'traffic_light_modes.dart';


/// Manages the global synchronization of traffic lights.
class TrafficLightProvider extends ChangeNotifier {
  bool _isSynchronized = false;
  TrafficLightState _currentState = TrafficLightState.stop;

  TrafficLightState get currentState => _currentState;
  bool get isSynchronized => _isSynchronized;

  void _stepCycle() {
    if (_isSynchronized) {
      _currentState = _currentState.next();
      Future.delayed(
        Duration(milliseconds: _currentState.duration),
        _stepCycle,
      );
    }
    notifyListeners();
  }

  void toggleSynchronization() {
    _isSynchronized = !_isSynchronized;
    if (_isSynchronized) {
      _currentState = TrafficLightState.caution;
      _stepCycle();
    }
    notifyListeners();
  }
}
