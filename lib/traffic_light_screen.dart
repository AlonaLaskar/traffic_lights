import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'traffic_light_control.dart';
import 'traffic_light_widget.dart';

class TrafficLightScreen extends StatelessWidget {
  const TrafficLightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<TrafficLightProvider>(
              builder: (context, provider, child) => ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 63, 127, 180)),
                ),
                onPressed: provider.toggleSynchronization,
                child: Text(
                  provider.isSynchronized ? 'Chaos' : 'Synchronize',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 234, 237, 239)),
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
