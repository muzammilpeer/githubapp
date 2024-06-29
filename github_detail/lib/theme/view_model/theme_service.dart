import 'package:flutter/material.dart';

import '../basic_theme.dart';
import '../dark_theme.dart';
import '../github_theme.dart';
import '../light_theme.dart';

class ThemeService extends ChangeNotifier {
  BasicTheme _currentTheme;

  ThemeService(this._currentTheme);

  BasicTheme get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme is LightTheme) {
      _currentTheme = DarkTheme();
    } else if (_currentTheme is DarkTheme) {
      _currentTheme = GitHubTheme();
    } else {
      _currentTheme = LightTheme();
    }
    notifyListeners();
  }
}
