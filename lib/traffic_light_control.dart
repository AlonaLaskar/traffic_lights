import 'package:flutter/material.dart';

/// Holds the different states of the traffic light
/// along with their respective durations and colors.
enum TrafficLightState {
  stop(Colors.red, Colors.grey, Colors.grey, duration: 3500),
  ready(Colors.red, Colors.yellow, Colors.grey, duration: 1500),
  go(Colors.grey, Colors.grey, Colors.green, duration: 3000),
  caution(Colors.grey, Colors.yellow, Colors.grey, duration: 1500);

  final Color redColor;
  final Color yellowColor;
  final Color greenColor;
  final int duration;

  const TrafficLightState(
    this.redColor,
    this.yellowColor,
    this.greenColor, {
    required this.duration,
  });

  TrafficLightState next() {
    switch (this) {
      case TrafficLightState.stop:
        return TrafficLightState.ready;
      case TrafficLightState.ready:
        return TrafficLightState.go;
      case TrafficLightState.go:
        return TrafficLightState.caution;
      case TrafficLightState.caution:
        return TrafficLightState.stop;
    }
  }
}

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
