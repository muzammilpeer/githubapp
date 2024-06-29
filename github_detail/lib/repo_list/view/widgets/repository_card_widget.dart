import 'package:flutter/material.dart';
import 'package:github_detail/repo_list/model/repository_model.dart';
import 'package:provider/provider.dart';

import '../../../theme/view_model/theme_service.dart';

class RepositoryCardWidget extends StatelessWidget {
  final RepositoryModel repositoryModel;

  const RepositoryCardWidget({super.key, required this.repositoryModel});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: theme.secondaryCardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: theme.secondaryCardShadowColor,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/github-mark.png",
              width: 50,
              height: 50,
              color: theme.titleTextColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repositoryModel.name,
                    style: TextStyle(
                        color: theme.secondaryCardTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    repositoryModel.description ?? "No description",
                    maxLines: 2,
                    style: TextStyle(
                        color: theme.secondaryCardTextColor,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        "Language: ${repositoryModel.language}",
                        style: TextStyle(
                            color: theme.secondaryCardTextColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Visibility: ${repositoryModel.visibility}",
                        style: TextStyle(
                            color: theme.secondaryCardTextColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
