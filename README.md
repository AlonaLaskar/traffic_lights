
---

# Traffic Light 

A simple Flutter application demonstrating a **traffic light** simulation. This project uses 
[Provider](https://pub.dev/packages/provider) for state management to toggle between synchronized (all lights change together) and unsynchronized (each light cycles randomly on its own).

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

- **main.dart**: Entry point of the application, setting up the ChangeNotifierProvider and TrafficLightScreen widget.
- **traffic_light_modes.dart**: Defines the `TrafficLightState` enum, describing the different states of the traffic lights along with their durations and colors.
- **traffic_light_control.dart**: Includes the `TrafficLightProvider` class for managing the synchronization and state transitions of traffic lights.
- **traffic_light_widget.dart**: Implements the `TrafficLight` widget that visually represents the traffic light and manages its state based on synchronization.
- **traffic_light_screen.dart**: Sets up the main screen layout and AppBar, incorporating the TrafficLight widget in a grid layout.

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

An enum that represents the different states a traffic light can have, each with specific colors and durations.

### TrafficLightProvider

A `ChangeNotifier` that manages whether traffic lights are synchronized and what the current “global” state is.

### TrafficLight Widget

A stateful widget that checks synchronization status, independently cycles through states if unsynchronized, or uses the global state if synchronized.

---

⭐⭐⭐⭐⭐