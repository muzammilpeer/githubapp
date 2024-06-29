import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/view_model/theme_service.dart';
import '../../model/commit_model.dart';

class CommitCardWidget extends StatelessWidget {
  final CommitModel commitModel;

  const CommitCardWidget({super.key, required this.commitModel});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commitModel.message,
            style: TextStyle(
                color: theme.secondaryCardTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        commitModel.committerAvatarUrl,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${commitModel.committerName} commited ${commitModel.timestamp}",
                            style: TextStyle(
                                color: theme.descriptionTextColor,
                                fontSize: 12),
                          ),
                          Row(
                            children: [
                              Icon(
                                  commitModel.isBuildSuccess
                                      ? Icons.check
                                      : Icons.close,
                                  color: commitModel.isBuildSuccess
                                      ? Colors.green
                                      : Colors.red),
                              const SizedBox(width: 5),
                              Text(commitModel.buildRuns,
                                  style: TextStyle(
                                      color: theme.descriptionTextColor,
                                      fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (commitModel.isVerified)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.badgeTextColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Verified",
                      style: TextStyle(
                        color: theme.badgeTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              const SizedBox(width: 10),
              Text(
                commitModel.commitHash,
                style: TextStyle(
                    color: theme.descriptionTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: commitModel.commitHash))
                        .then((_) {
                      // controller.clear();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to your clipboard !')));
                    });
                  },
                  icon: Icon(
                    Icons.copy,
                    color: theme.descriptionTextColor,
                  )),
              IconButton(
                  onPressed: () async {
                    if (await launchUrl(Uri(path: commitModel.commitUrl),
                        mode: LaunchMode.inAppBrowserView)) {
                      throw Exception('Could not launch ');
                    }
                  },
                  icon: Icon(
                    Icons.open_in_browser,
                    color: theme.descriptionTextColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
