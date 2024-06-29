import 'package:flutter/material.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo.dart';
import 'package:github_detail/repo_detail/view/repo_detail_view.dart';
import 'package:github_detail/repo_detail/viewmodel/repository_detail_viewmodel.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo.dart';
import 'package:github_detail/repo_list/view/repo_list_view.dart';
import 'package:github_detail/repo_list/view_model/repository_viewmodel.dart';
import 'package:github_detail/start/view/start_view.dart';
import 'package:github_detail/theme/light_theme.dart';
import 'package:github_detail/theme/view_model/theme_service.dart';
import 'package:provider/provider.dart';

import 'github_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(
          create: (_) => ThemeService(LightTheme()),
        ),
        ChangeNotifierProvider(
            create: (_) => RepositoryViewModel(
                repo: serviceLocator.get<RepositoryListRepo>())),
        ChangeNotifierProvider(
            create: (_) => RepositoryDetailViewModel(
                repo: serviceLocator.get<RepositoryDetailRepo>())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: themeNotifier.currentTheme.primaryColor,
          canvasColor: themeNotifier.currentTheme.canvasColor,
          appBarTheme: AppBarTheme(
            backgroundColor: themeNotifier.currentTheme.appBarBackgroundColor,
            foregroundColor: themeNotifier.currentTheme.appBarForegroundColor,
          ),
        ),
        home: const StartView(),
        routes: {
          "/repoList": (BuildContext context) => const RepoListView(),
          "/repoDetail": (BuildContext context) => const RepoDetailView(),
        },
      );
    });
  }
}
