import 'package:flutter/material.dart';
import 'package:github_detail/repo_list/model/repository_model.dart';
import '../../shared/base_dual_loading_viewmodel.dart';
import '../model/user_model.dart';
import '../repository/repository_list_repo.dart';

class RepositoryViewModel extends BaseDualLoadingViewModel {
  // private variables
  late int _currentIndex = 0;
  late List<RepositoryModel> _repositories = [];
  late List<UserModel> _users = [];

  // public variables
  final RepositoryListRepo repo;

  // constructor
  RepositoryViewModel({
    required this.repo,
  });

  List<RepositoryModel> get repositories => _repositories;

  int get currentIndex => _currentIndex;

  List<UserModel> get users => _users;

  Future<void> fetchUserProfiles(List<String> userNames) async {
    try {
      isLoading = true;
      isSecondaryLoading = true;
      _users = await repo.fetchUsers(userNames);
    } catch (exc) {
      debugPrint('Error in fetchUserProfiles : ${exc.toString()}');
    }
    isLoading = false;
    if (!_users.isNotEmpty) {
      isSecondaryLoading = false;
      return;
    }
    fetchRepositories(_users[0]);
  }

  Future<void> fetchRepositories(UserModel user) async {
    try {
      isSecondaryLoading = true;
      _currentIndex = _users.indexOf(user);
      _repositories = await repo.fetchRepositories(user.userName);
    } catch (exc) {
      debugPrint('Error in fetchRepositories : ${exc.toString()}');
    }
    isSecondaryLoading = false;
    notifyListeners();
  }
}
