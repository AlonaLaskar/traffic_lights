import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'traffic_light_control.dart';
import 'traffic_light_modes.dart';


class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  late TrafficLightState _currentState;
  late bool _isSynchronized;

  @override
  void initState() {
    super.initState();
    // Grab initial sync state from the provider without listening for changes.
    _currentState = TrafficLightState.stop;//start with red light
    _isSynchronized =
        Provider.of<TrafficLightProvider>(context, listen: false).isSynchronized;

    _startCycle();
  }

  void _stepCycle() {
    if (!_isSynchronized) {
      setState(() {
        _currentState = _currentState.next();
      });
      Future.delayed(
        Duration(milliseconds: _currentState.duration),
        _stepCycle,
      );
    }
  }

  void _startCycle([TrafficLightProvider? manager]) async {
    _currentState = TrafficLightState.stop;
    _isSynchronized = manager?.isSynchronized ?? false;

    if (!_isSynchronized) {
      // Introduce some randomness in the initial delay for Chaos lights.
      Future.delayed(
        Duration(milliseconds: Random().nextInt(5000)),
        _stepCycle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrafficLightProvider>(
      builder: (context, provider, child) {
        // If the synchronization state changes, restart the cycle accordingly.
        if (_isSynchronized != provider.isSynchronized) {
          _startCycle(provider);
        }

        // If synchronized, follow the provider's current state.
        if (provider.isSynchronized) {
          _currentState = provider.currentState;
        }

        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: ['red', 'yellow', 'green']
                .map((lightType) => _buildLight(lightType))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildLight(String lightType) {
    final color = switch (lightType) {
      'red' => _currentState.redColor,
      'yellow' => _currentState.yellowColor,
      'green' => _currentState.greenColor,
      _ => Colors.grey,
    };
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
