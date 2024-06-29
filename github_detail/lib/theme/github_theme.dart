import 'package:flutter/material.dart';

import 'basic_theme.dart';

class GitHubTheme implements BasicTheme {
  @override
  MaterialColor get primaryColor => Colors.blue;

  @override
  Color get canvasColor => Colors.black;

  @override
  Color get titleTextColor => Colors.white;

  @override
  Color get subTitleTextColor => Colors.grey[300]!;

  @override
  Color get descriptionTextColor => Colors.grey[600]!;

  @override
  Color get appBarBackgroundColor => Colors.black;

  @override
  Color get appBarForegroundColor => Colors.white;

  @override
  Color get badgeTextColor => Colors.orange;

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
