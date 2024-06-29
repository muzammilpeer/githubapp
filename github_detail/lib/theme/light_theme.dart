import 'package:flutter/material.dart';

import 'basic_theme.dart';

class LightTheme implements BasicTheme {
  @override
  MaterialColor get primaryColor => Colors.grey;

  @override
  Color get canvasColor => Colors.white;

  @override
  Color get titleTextColor => Colors.white;

  @override
  Color get subTitleTextColor => Colors.black;

  @override
  Color get descriptionTextColor => Colors.grey;

  @override
  Color get appBarBackgroundColor => Colors.transparent;

  @override
  Color get appBarForegroundColor => Colors.black;

  @override
  Color get badgeTextColor => Colors.green;

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
  Color get secondaryCardTextColor => Colors.black;
}
