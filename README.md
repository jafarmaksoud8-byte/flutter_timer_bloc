# 🌊 Flutter Ocean Timer App
<p align="center">
  <img src="https://raw.githubusercontent.com/jafarmaksoud8-byte/flutter_timer_bloc/main/assets/images/timer_demo.gif" width="300" alt="Flutter Timer Demo">
</p>

A sleek, modern countdown timer application built with **Flutter**, powered by the **BLoC (Business Logic Component)** state management pattern, and enhanced with beautiful wave animations.

## ✨ Features
- **BLoC Architecture**: Clean separation of business logic and UI using Events and States.
- **Stream-Based Ticker**: Utilizes `Stream.periodic` for accurate second-by-second countdown management.
- **Full Control**: Support for **Play**, **Pause**, **Resume**, and **Reset** operations seamlessly.
- **Dynamic UI**: Responsive UI components reacting to state changes with custom wave backgrounds.

## 🛠️ Tech Stack & Packages
- **Flutter & Dart**
- **flutter_bloc** (State Management)
- **wave** (Animated ocean wave background)
- **meta** (Annotations)

## 📂 Project Architecture
```text
lib/
│
├── bloc/
│   ├── timer_bloc.dart
│   ├── timer_event.dart
│   └── timer_state.dart
│
├── constant/
│   └── app_color.dart
│
├── ui/
│   ├── views/
│   │   └── home_view.dart
│   └── widgets/
│       ├── button_widget.dart
│       ├── ocean_wave_widget.dart
│       ├── text_widget.dart
│       └── timer_content_widget.dart
│
└── main.dart
