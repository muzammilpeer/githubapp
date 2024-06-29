import 'package:flutter/material.dart';

import 'basic_theme.dart';

class DarkTheme implements BasicTheme {
  @override
  MaterialColor get primaryColor => Colors.blueGrey;

  @override
  Color get canvasColor => Colors.grey[850]!;

  @override
  Color get titleTextColor => Colors.white;

  @override
  Color get subTitleTextColor => Colors.grey[300]!;

  @override
  Color get descriptionTextColor => Colors.grey[500]!;

  @override
  Color get appBarBackgroundColor => Colors.black;

  @override
  Color get appBarForegroundColor => Colors.white;

  @override
  Color get badgeTextColor => Colors.red;

  @override
  Color get primaryCardColor => Colors.orangeAccent;

  @override
  Color get primaryCardShadowColor => Colors.grey.shade50;

  @override
  Color get secondaryCardColor => Colors.grey[200]!;

  @override
  Color get secondaryCardShadowColor => Colors.grey.shade300;

  @override
  Color get primaryCardTextColor => Colors.black;

  @override
  Color get secondaryCardTextColor => Colors.white;
}
