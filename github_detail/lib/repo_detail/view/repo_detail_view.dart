import 'package:flutter/material.dart';
import 'package:github_detail/repo_detail/view/widgets/banner_card_widget.dart';
import 'package:github_detail/repo_detail/view/widgets/commit_card_widget.dart';
import 'package:github_detail/theme/basic_theme.dart';
import 'package:provider/provider.dart';

import '../../repo_list/model/repository_model.dart';
import '../../theme/view_model/theme_service.dart';
import '../viewmodel/repository_detail_viewmodel.dart';

class RepoDetailView extends StatelessWidget {
  const RepoDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RepositoryModel repositoryModel =
        ModalRoute.of(context)!.settings.arguments as RepositoryModel;

    BasicTheme theme =
        Provider.of<ThemeService>(context, listen: false).currentTheme;
    RepositoryDetailViewModel repositoryDetailViewModel =
        Provider.of<RepositoryDetailViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      repositoryDetailViewModel.fetchCommits(repositoryModel);
    });

    return Consumer<RepositoryDetailViewModel>(builder:
        (BuildContext context, RepositoryDetailViewModel model, Widget? child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: theme.appBarBackgroundColor,
              foregroundColor: theme.appBarForegroundColor,
              elevation: 0,
              title: Text("Repo: ${repositoryModel.name} !"),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (repositoryDetailViewModel.isLoading)
                  const Center(child: CircularProgressIndicator())
                else ...[
                  BannerCardWidget(
                      repositoryName: repositoryModel.name,
                      starsCount: repositoryModel.starsCount,
                      forksCount: repositoryModel.forksCount,
                      issuesCount: repositoryModel.issuesCount,
                      watchersCount: repositoryModel.watchersCount),
                  const SizedBox(height: 10),
                  Text("Description: ${repositoryModel.description ?? "No description"}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: theme.subTitleTextColor)),
                  const SizedBox(height: 10),
                  Text("Commits:",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: theme.subTitleTextColor)),
                  if (repositoryDetailViewModel.commitsModelList.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            repositoryDetailViewModel.commitsModelList.length,
                        itemBuilder: (context, index) {
                          return CommitCardWidget(
                              commitModel: repositoryDetailViewModel
                                  .commitsModelList[index]);
                        },
                      ),
                    )
                  else
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text("No commits found"),
                      ),
                    )
                ]
              ],
            ),
          ));
    });
  }
}
