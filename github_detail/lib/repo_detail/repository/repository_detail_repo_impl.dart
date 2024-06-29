import 'dart:convert';

import 'package:github_detail/repo_detail/model/commit_model.dart';
import 'package:github_detail/repo_detail/repository/repository_detail_repo.dart';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../config.dart';

class RepositoryDetailRepoImpl implements RepositoryDetailRepo {
  @override
  Future<List<CommitModel>> fetchCommits(
      String userName, String repoName) async {
    try {
      var endpoint =
          Uri.parse("${Config.API_URL}repos/$userName/$repoName/commits");
      // if you want to see build status use below end point
      // https://github.com/muzammilpeer/CS193p/commits/deferred_commit_data/master?original_branch=master
      final response = await http.get(endpoint, headers: {
        "Authorization": "Bearer ${Config.API_TOKEN}",
      });
      if (response.statusCode == 200) {
        var decodedList = json.decode(response.body) as List;
        List<CommitModel> commitsList = decodedList.map((obj) {
          return CommitModel.fromJson(obj);
        }).toList();
        return commitsList;
      } else {
        throw Exception("API is not succesfull");
      }
    } on SocketException {
      throw Exception("No internet connection");
    } on HttpException {
      throw Exception("Failed to load attachment images");
    } on FormatException {
      throw Exception("Invalid response format");
    } catch (e) {
      throw Exception("unknown exception");
    }
  }
}
