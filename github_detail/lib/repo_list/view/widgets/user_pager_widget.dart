import 'package:flutter/material.dart';
import 'package:github_detail/repo_list/view/widgets/user_pager_card_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/repository_viewmodel.dart';
import '../../model/user_model.dart';
import '../../../theme/view_model/theme_service.dart';

class UserPagerWidget extends StatelessWidget {
  final Function(UserModel) onUserSelection;
  final List<UserModel> users;
  final PageController pageController;

  UserPagerWidget({
    super.key,
    required this.users,
    required this.pageController,
    required this.onUserSelection,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context).currentTheme;
    final RepositoryViewModel repositoryNotifier =
        Provider.of<RepositoryViewModel>(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: PageView.builder(
            onPageChanged: (index) {
              onUserSelection(users[index]);
            },
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserPagerCardWidget(userModel: users[index]);
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(users.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: repositoryNotifier.currentIndex == index ? 24.0 : 8.0,
              decoration: BoxDecoration(
                color: repositoryNotifier.currentIndex == index
                    ? Colors.blue
                    : Colors.grey,
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }
}
