
---

# Traffic Light 

A simple Flutter application demonstrating a **traffic light** simulation. This project uses [Provider](https://pub.dev/packages/provider) for state management to toggle between synchronized (all lights change together) and unsynchronized (each light cycles randomly on its own).

---

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [How It Works](#how-it-works)
  - [TrafficLightState](#trafficlightstate)
  - [TrafficLightProvider](#trafficlightprovider)
  - [TrafficLight](#trafficlight-widget)


---

## Features

1. **Traffic Light Simulation**: The lights cycle through stop (red), ready (red+yellow), go (green), and caution (yellow).
2. **Synchronized vs. Unsynchronized**:
   - *Synchronized*: All traffic lights follow the same cycle and timing.
   - *Unsynchronized*: Each traffic light runs on its own independent timer, with a random initial delay.
3. **Provider Integration**: State management for enabling or disabling synchronization globally.


## Project Structure

lib/
├─ main.dart                   # Application entry point
├─ traffic_light_control.dart  # State management (provider + traffic light states)
└─ traffic_light_widget.dart   # The TrafficLight widget and its internal state


- **main.dart**: Contains the main() function and the TrafficLightApp widget that sets up the app layout.
- **traffic_light_control.dart**:  
  - **TrafficLightState (enum)**: Defines the traffic light states and durations.  
  - **TrafficLightProvider**: Manages whether all lights are synchronized and what the current “global” state is.
- **traffic_light_widget.dart**:  
  - **TrafficLight** widget: Displays a single traffic light.  
  - Manages local state if not synchronized with the global provider.

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `3.x` or higher recommended)
- [Dart](https://dart.dev/get-dart) (usually bundled with Flutter)
- An IDE such as [Android Studio](https://developer.android.com/studio), [VSCode](https://code.visualstudio.com/), or [IntelliJ IDEA](https://www.jetbrains.com/idea/) with the Flutter plugin.

### Installation

1. **Clone** or **download** this repository:
   ```bash
   git clone https://github.com/AlonaLaskar/traffic_lights.git 
   cd traffic_light
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

### Running the App

1. **Connect** a physical device via USB with Developer Mode enabled, or **start** an emulator/simulator.
2. **Run** the app:
   ```bash
   flutter run
   ```

If everything is set up properly, the traffic light grid should appear, and you can toggle synchronization via the **“Synchronize / Chaos”** button in the AppBar.

---

## How It Works

### TrafficLightState

An enum that represents the different states a traffic light can have:
```dart
enum TrafficLightState {
  stop(Colors.red, Colors.grey, Colors.grey, duration: 3500),
  ready(Colors.red, Colors.yellow, Colors.grey, duration: 1500),
  go(Colors.grey, Colors.grey, Colors.green, duration: 3000),
  caution(Colors.grey, Colors.yellow, Colors.grey, duration: 1500);
  // ...
}
```
Each state includes the *colors* for the red, yellow, and green lights, as well as a *duration* in milliseconds.

### TrafficLightProvider

A `ChangeNotifier` that manages:
1. Whether traffic lights are synchronized (`_isSynchronized`).
2. The global `TrafficLightState` (`_currentState`).

When synchronized, all lights follow the same state transitions. When unsynchronized, each traffic light runs independently.

### TrafficLight Widget

A stateful widget that:
- Checks if the light is synchronized.
- Cycles through states independently if not synchronized.
- If synchronization is enabled, uses the provider’s global state.



Happy Coding! If you find this project useful or interesting, consider giving it a ⭐ on GitHub
