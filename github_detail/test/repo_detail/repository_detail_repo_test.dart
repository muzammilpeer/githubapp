import 'package:flutter_test/flutter_test.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:github_detail/repo_detail/model/commit_model.dart';

import 'repository_detail_repo_test.mocks.dart';

class RepositoryDetailRepoTest extends Mock implements RepositoryDetailRepo {}

@GenerateMocks([RepositoryDetailRepoTest])
Future<void> main() async {
  late MockRepositoryDetailRepoTest repositoryDetailRepoTest;

  setUpAll(() {
    repositoryDetailRepoTest = MockRepositoryDetailRepoTest();
  });

  group('repository detail repo test', () {
    test('test fetchData', () async {
      CommitModel mockCommitModel = CommitModel(
        message: "Merge pull request #1 from test/test",
        committerName: "test",
        committerAvatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
        timestamp: "Jan, 1 2021",
        isBuildSuccess: true,
        buildRuns: "1/1",
        isVerified: true,
        commitHash: "1234567",
        commitUrl: "https://www.google.com",
      );
      final List<CommitModel> response = [mockCommitModel];

      when(repositoryDetailRepoTest.fetchCommits("test", "test"))
          .thenAnswer((_) async {
        return response;
      });

      final res = await repositoryDetailRepoTest.fetchCommits("test", "test");

      expect(res, isA<List<CommitModel>>());
      expect(res, response);
    });

    test('test fetchCommits throws socket exception', () {
      when(repositoryDetailRepoTest.fetchCommits("test", "test"))
          .thenAnswer((_) async {
        throw Exception("Socket Exception");
      });

      expect(
          repositoryDetailRepoTest.fetchCommits("test", "test"),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: Socket Exception')));
    });
  });
}
