import 'package:github_detail/repo_list/model/user_model.dart';

import '../model/repository_model.dart';

abstract class RepositoryListRepo {
  Future<List<UserModel>> fetchUsers(List<String> userNames);

  Future<List<RepositoryModel>> fetchRepositories(String userName);
}
