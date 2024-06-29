import 'package:flutter/services.dart';
import 'package:github_detail/repo_list/model/user_model.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo.dart';

import '../model/repository_model.dart';
import 'dart:convert';

class RepositoryListRepoMockImpl implements RepositoryListRepo {
  @override
  Future<List<UserModel>> fetchUsers(List<String> userNames) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final String response =
        await rootBundle.loadString('assets/mock/users.json');
    List<dynamic> decodedList = json.decode(response) as List;
    return decodedList.map((obj) => UserModel.fromJson(obj)).toList();
  }

  @override
  Future<List<RepositoryModel>> fetchRepositories(String userName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final String response =
        await rootBundle.loadString('assets/mock/repositories.json');
    var decodedList = json.decode(response) as Map;
    if (!decodedList.containsKey(userName)) {
      return [];
    }
    var repositoriesList = decodedList[userName] as List;
    return repositoriesList
        .map((obj) => RepositoryModel.fromJson(obj))
        .toList();
  }
}
