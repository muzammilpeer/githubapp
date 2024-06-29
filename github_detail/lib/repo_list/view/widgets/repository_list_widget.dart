import 'package:flutter/material.dart';
import 'package:github_detail/repo_list/view/widgets/repository_card_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/repository_viewmodel.dart';
import '../../../theme/view_model/theme_service.dart';

class RepositoryListWidget extends StatelessWidget {
  const RepositoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    final repositoryNotifier = Provider.of<RepositoryViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Git Repositories",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: theme.subTitleTextColor)),
        if (repositoryNotifier.repositories.isNotEmpty)
          Expanded(
              child: ListView.builder(
                  itemCount: repositoryNotifier.repositories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/repoDetail",
                            arguments: repositoryNotifier.repositories[index]);
                      },
                      child: RepositoryCardWidget(
                          repositoryModel:
                              repositoryNotifier.repositories[index]),
                    );
                  }))
        else
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text("No repository found"),
            ),
          )
      ],
    );
  }
}
