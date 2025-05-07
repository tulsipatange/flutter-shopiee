# Exercise 1: Shopiee App

A new Flutter project named Shopiee.

## Project Overview
This document provides a comprehensive guide to configuring and running the Shopiee App, a beginner-friendly Flutter application that allows users to browse products, add items to their cart, and calculate their shopping total.

## Project Structure
flutter-shopiee/
│
├── lib/
│    ├── models              # All the models used
│    │   ├── cart_item.dart
│    │   ├── demo_products.dart
│    │   └── product.dart
│    ├── screens             # All the UI screens used
│    │   ├── cart_screen.dart
│    │   └── product_list_screen.dart
│    ├── widgets             # All the widgets used
│    │   ├── cart_item.dart
│    │   ├── product_grid.dart
│    │   └── product_item.dart                         
│    └── main.dart           # Application entry point
├── pubspec.yaml            # Flutter dependencies
└── README.md               # Project documentation

The project follows a simplified structure with all code contained in thier own namespace for easy readability.

Follow the steps below to clone and run the app locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.x.x)
- [Git](https://git-scm.com/)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- Xcode (for macOS/iOS builds)
- Android SDK (bundled with Android Studio)

To verify Flutter is installed:

```bash
flutter doctor
```

### Setup Instructions
1. Clone the Repository
```bash
git clone https://github.com/tulsipatange/flutter-shopiee.git 
cd 
```

2. Install Dependencies
```bash
flutter pub get
```

### Run the App

#### Run on Android 
Make sure an emulator is running or a device is connected.
```bash
flutter run
```
#### Run on iOS (Requires macOS with Xcode installed.) 
Make sure an iOS emulator is running or a iOS device is connected.
```bash
flutter run -d ios
```
#### Run on Web 
```bash
flutter run -d web
```