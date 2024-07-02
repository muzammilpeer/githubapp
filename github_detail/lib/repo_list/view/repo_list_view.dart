import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_detail/repo_list/view_model/repository_viewmodel.dart';
import 'package:github_detail/repo_list/model/user_model.dart';
import 'package:github_detail/repo_list/view/widgets/user_pager_widget.dart';
import 'package:provider/provider.dart';

import '../../theme/basic_theme.dart';
import '../../theme/view_model/theme_service.dart';
import 'widgets/repository_list_widget.dart';

class RepoListView extends StatelessWidget {
  const RepoListView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO : Remove this code once ios native app integration is done
    // if (users == null || users!.isEmpty) {
    //   users = ModalRoute.of(context)!.settings.arguments as List<UserModel>;
    // }
    String responseReceived = "No data received yet!";
    BasicTheme theme =
        Provider.of<ThemeService>(context, listen: false).currentTheme;
    RepositoryViewModel repositoryViewModel =
        Provider.of<RepositoryViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      const platform = MethodChannel('uk.muzammilpeer.github_deatil/data');
      responseReceived = await platform.invokeMethod('getData');

      // repositoryViewModel.fetchUserProfiles([]);
    });

    return Consumer<RepositoryViewModel>(builder:
        (BuildContext context, RepositoryViewModel model, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: theme.appBarBackgroundColor,
          foregroundColor: theme.appBarForegroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Repositories !"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(responseReceived),
              if (repositoryViewModel.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                UserPagerWidget(
                    users: repositoryViewModel.users,
                    pageController: PageController(initialPage: 0),
                    onUserSelection: (UserModel user) {
                      repositoryViewModel.fetchRepositories(user);
                    }),
              if (repositoryViewModel.isSecondaryLoading)
                const Expanded(
                    child: Center(child: CircularProgressIndicator()))
              else
                const Expanded(child: RepositoryListWidget()),
            ],
          ),
        ),
      );
    });
  }
}
