import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/view_model/theme_service.dart';
import '../../model/user_model.dart';

class UserPagerCardWidget extends StatelessWidget {
  final UserModel userModel;

  const UserPagerCardWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
        children: [
          ClipOval(
              child: Image.network(userModel.avatarUrl,
                  width: 50, height: 50, fit: BoxFit.cover)),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: theme.titleTextColor),
              ),
              Text(
                userModel.userName,
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    color: theme.titleTextColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
