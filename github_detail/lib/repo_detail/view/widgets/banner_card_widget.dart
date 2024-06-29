import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/view_model/theme_service.dart';

class BannerCardWidget extends StatelessWidget {
  final String repositoryName;
  final int starsCount;
  final int forksCount;
  final int issuesCount;
  final int watchersCount;

  const BannerCardWidget(
      {super.key,
      required this.repositoryName,
      required this.starsCount,
      required this.forksCount,
      required this.issuesCount,
      required this.watchersCount});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.primaryCardColor,
        boxShadow: [
          BoxShadow(
            color: theme.primaryCardShadowColor,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Image.asset(
            "assets/images/github-mark.png",
            width: 80,
            height: 80,
            color: theme.titleTextColor,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repositoryName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.titleTextColor),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.white),
                  Text(
                    starsCount.toString(),
                    style: TextStyle(fontSize: 15, color: theme.titleTextColor),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.call_split, color: Colors.white),
                  Text(
                    forksCount.toString(),
                    style: TextStyle(fontSize: 15, color: theme.titleTextColor),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.error, color: Colors.white),
                  Text(
                    issuesCount.toString(),
                    style: TextStyle(fontSize: 15, color: theme.titleTextColor),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.remove_red_eye, color: theme.titleTextColor),
                  Text(
                    watchersCount.toString(),
                    style: TextStyle(fontSize: 15, color: theme.titleTextColor),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
