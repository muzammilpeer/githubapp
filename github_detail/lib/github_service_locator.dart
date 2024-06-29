import 'package:github_detail/repo_detail/repository/repository_detail_repo.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo_impl.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo_mock_impl.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo_impl.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo_mock_impl.dart';
import 'package:github_detail/shared/service_locator.dart';

import 'config.dart';

final serviceLocator = ServiceLocator();

Future<void> setupServiceLocator() async {
  // serviceLocator.registerLazySingleton<NavigationService>(() => NavigationService());

  serviceLocator.registerFactory<RepositoryListRepo>(() =>
      Config.isMock ? RepositoryListRepoMockImpl() : RepositoryListRepoImpl());
  serviceLocator.registerFactory<RepositoryDetailRepo>(() => Config.isMock
      ? RepositoryDetailRepoMockImpl()
      : RepositoryDetailRepoImpl());
}
