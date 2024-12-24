import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'traffic_light_control.dart';

import 'traffic_light_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TrafficLightProvider(),
      child: const TrafficLightApp(),
    ),
  );
}

class TrafficLightApp extends StatelessWidget {
  const TrafficLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<TrafficLightProvider>(
              builder: (context, provider, child) => ElevatedButton(
                onPressed: provider.toggleSynchronization,
                child: Text(
                  provider.isSynchronized ? 'Chaos' : 'Synchronize',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 223, 199, 199)),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 0.55,
                ),
                itemCount: 1000,
                itemBuilder: (BuildContext context, int index) {
                  return const TrafficLight();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
