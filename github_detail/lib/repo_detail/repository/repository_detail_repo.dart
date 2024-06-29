import 'package:github_detail/repo_detail/model/commit_model.dart';

abstract class RepositoryDetailRepo {
  Future<List<CommitModel>> fetchCommits(String userName, String repoName);
}