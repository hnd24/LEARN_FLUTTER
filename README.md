# Learn Flutter — Practice Project

Purpose: This project is for learning and practicing Flutter following a video series: https://www.youtube.com/watch?v=p1l-BUtjHJk&list=PLyxSzL3F7484qhNw1K08o8kDn8ecCpA_j

Main content: follow the videos, try basic widgets, navigation, state management, and illustrative icons configuration.

## How to run

Prerequisites: Flutter SDK installed, and an emulator or physical device.

1. Clone repository:
   git clone <repo-url>
2. Open project:
   cd <project-folder>
3. Install dependencies:
   flutter pub get
4. Run on connected device or emulator:
   flutter run
5. Run on Chrome (web):
   flutter run -d chrome
6. Build release APK:
   flutter build apk --release

If using VS Code or Android Studio, open the project folder and use the Run/Debug controls.

## Illustrative icons

-   Add an example icon file: assets/icon.png (recommended size 512×512, PNG).
-   Register the asset in pubspec.yaml:

    flutter:
    assets: - assets/icon.png

-   Display in the app (example):

    Image.asset('assets/icon.png', width: 64, height: 64);

Optional — generate launcher icons automatically with flutter_launcher_icons:

1. Add to dev_dependencies and configure pubspec.yaml:

    dev_dependencies:
    flutter_launcher_icons: ^0.10.0

    flutter_icons:
    android: true
    ios: true
    image_path: "assets/icon.png"

2. Run:

    flutter pub get
    flutter pub run flutter_launcher_icons:main

This will create platform-specific launcher icons from assets/icon.png.

---

Additional information: Any README changes should clearly state learning goals and environment/setup steps so others can follow easily.
