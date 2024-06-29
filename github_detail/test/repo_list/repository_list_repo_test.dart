import 'package:flutter_test/flutter_test.dart';
import 'package:github_detail/repo_list/model/repository_model.dart';
import 'package:github_detail/repo_list/model/user_model.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repository_list_repo_test.mocks.dart';

class RepositoryListRepoTest extends Mock implements RepositoryListRepo {}


@GenerateMocks([RepositoryListRepoTest])
Future<void> main() async {
  late MockRepositoryListRepoTest repositoryListRepoTest;

  setUpAll(() {
    repositoryListRepoTest = MockRepositoryListRepoTest();
  });

  group('repository list test', () {
    test('test fetchUsers', () async {
      UserModel mockUserModel = UserModel(
        userName: "test",
        name: "test",
        email: "test@test.com",
        avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
      );
      final List<UserModel> response = [mockUserModel];

      when(repositoryListRepoTest.fetchUsers([])).thenAnswer((_) async {
        return response;
      });

      final res = await repositoryListRepoTest.fetchUsers([]);

      expect(res, isA<List<UserModel>>());
      expect(res, response);
    });

    test('test fetchRepositories', () async {
      Owner mockOwner = Owner(
        login: "test",
        avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
      );
      RepositoryModel mockRepository = RepositoryModel(
        name: "test",
        description: "test",
        pushedAt: "Jan, 1 2021",
        language: "Dart",
        forksCount: 1,
        starsCount: 1,
        watchersCount: 1,
        issuesCount: 1,
        visibility: "public",
        owner: mockOwner,
      );
      final List<RepositoryModel> response = [mockRepository];

      when(repositoryListRepoTest.fetchRepositories("test"))
          .thenAnswer((_) async {
        return response;
      });

      final res = await repositoryListRepoTest.fetchRepositories("test");

      expect(res, isA<List<RepositoryModel>>());
      expect(res, response);
    });

    test('repository list fetchRepositories throws socket exception', () {
      when(repositoryListRepoTest.fetchRepositories("test"))
          .thenAnswer((_) async {
        throw Exception("Socket Exception");
      });

      expect(
          repositoryListRepoTest.fetchRepositories("test"),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: Socket Exception')));
    });
  });
}
