import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/view_model/theme_service.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: theme.appBarBackgroundColor,
          foregroundColor: theme.appBarForegroundColor,
          elevation: 0,
          title: const Text("Github!"),
        ),
        body: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/repoList");
              },
              child: const Text("Show Repositories")),
        ])));
  }
}
