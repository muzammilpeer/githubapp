import 'package:flutter/foundation.dart';
import 'package:github_detail/repo_detail/model/commit_model.dart';

import '../../repo_list/model/repository_model.dart';
import '../../shared/base_loading_viewmodel.dart';
import '../repository/repository_detail_repo.dart';

class RepositoryDetailViewModel extends BaseLoadingViewModel {
  final RepositoryDetailRepo repo;

  RepositoryDetailViewModel({required this.repo});

  late List<CommitModel> _commitsModelList = [];

  List<CommitModel> get commitsModelList => _commitsModelList;

  Future<void> fetchCommits(RepositoryModel repository) async {
    try {
      isLoading = true;
      _commitsModelList =
          await repo.fetchCommits(repository.owner.login, repository.name);
    } catch (exc) {
      debugPrint('Error in getRepositoryDetail : ${exc.toString()}');
    }
    isLoading = false;
    notifyListeners();
  }
}
