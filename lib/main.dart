import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'traffic_light_control.dart';
import 'traffic_light_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TrafficLightProvider(),
      child: const TrafficLightScreen(),
    ),
  );
}
