# fiveminslearn

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to change app icon

1. Place the icon in the icon directory (lib/assets/images/)
2. Change the app icon name in `pubspec.yaml` file
```
flutter_launcher_icons:
  image_path: "lib/assets/images/5minslearn_logo.png"
```
3. Run the following command in project root
```
flutter pub get
flutter pub run flutter_launcher_icons
```
