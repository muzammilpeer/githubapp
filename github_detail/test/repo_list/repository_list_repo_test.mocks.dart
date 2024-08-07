// Mocks generated by Mockito 5.4.4 from annotations
// in github_detail/test/repo_list/repository_list_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:github_detail/repo_list/model/repository_model.dart' as _i5;
import 'package:github_detail/repo_list/model/user_model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'repository_list_repo_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RepositoryListRepoTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepositoryListRepoTest extends _i1.Mock
    implements _i2.RepositoryListRepoTest {
  MockRepositoryListRepoTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.UserModel>> fetchUsers(List<String>? userNames) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [userNames],
        ),
        returnValue: _i3.Future<List<_i4.UserModel>>.value(<_i4.UserModel>[]),
      ) as _i3.Future<List<_i4.UserModel>>);

  @override
  _i3.Future<List<_i5.RepositoryModel>> fetchRepositories(String? userName) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchRepositories,
          [userName],
        ),
        returnValue: _i3.Future<List<_i5.RepositoryModel>>.value(
            <_i5.RepositoryModel>[]),
      ) as _i3.Future<List<_i5.RepositoryModel>>);
}
