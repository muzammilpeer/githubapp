import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:github_detail/repo_detail/model/commit_model.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo.dart';

class RepositoryDetailRepoMockImpl implements RepositoryDetailRepo {
  @override
  Future<List<CommitModel>> fetchCommits(
      String userName, String repoName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final String response =
        await rootBundle.loadString('assets/mock/commits.json');
    var decodedList = json.decode(response) as Map;
    if (!decodedList.containsKey(userName)) {
      return [];
    }
    var repository = decodedList[userName] as Map;
    if (!repository.containsKey(repoName)) {
      return [];
    }
    var commitsList = repository[repoName] as List;
    return commitsList.map((obj) => CommitModel.fromJson(obj)).toList();
  }
}
