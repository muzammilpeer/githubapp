# githubapp
sample app integration with flutter and native ios/native code

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