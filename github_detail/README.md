# github_detail

Module for Github detail page

## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).

# create module for flutter
flutter create --template module github_detail

## Packages
dart pub add mockito
dart pub add intl
dart pub add http
dart pub add provider
dart pub add url_launcher

# Generate build runner related files
flutter pub run build_runner build

# run test and add coverage
flutter test --coverage test

Xcode:
Build Settings-> Build option -> User Script Sandboxing = No

# Compile framework for iOS
flutter build ios-framework