import 'package:flutter/material.dart';

/// Defines the various states of a traffic light, each associated with specific light colors and durations.
/// This allows for controlled transitions between states in the traffic light simulation.


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