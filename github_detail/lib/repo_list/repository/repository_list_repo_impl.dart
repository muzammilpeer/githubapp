import 'package:flutter/services.dart';
import 'package:github_detail/config.dart';
import 'package:github_detail/repo_list/model/user_model.dart';
import 'package:github_detail/repo_list/repository/repository_list_repo.dart';

import '../model/repository_model.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RepositoryListRepoImpl implements RepositoryListRepo {
  @override
  Future<List<UserModel>> fetchUsers(List<String> userNames) async {
    // await Future.delayed(const Duration(milliseconds: 1800));
    // final String response =
    //     await rootBundle.loadString('assets/mock/users.json');
    // List<dynamic> decodedList = json.decode(response) as List;
    // return decodedList.map((obj) => UserModel.fromJson(obj)).toList();
    // try {
    //   final String jsonString = await platform.invokeMethod('getData');
    //   final List<dynamic> jsonData = jsonDecode(jsonString);
    //   setState(() {
    //     users = jsonData.map((data) => User.fromJson(data)).toList();
    //   });
    // } on PlatformException catch (e) {
    //   print("Failed to receive data: '${e.message}'.");
    // }

    // await Future.delayed(const Duration(milliseconds: 1800));
    const platform = MethodChannel('uk.muzammilpeer.github_deatil/data');
    final String response = await platform.invokeMethod('getData');
    List<dynamic> decodedList = json.decode(response) as List;
    print("decodedList: $decodedList");

    return decodedList.map((obj) => UserModel.fromJson(obj)).toList();
  }

  @override
  Future<List<RepositoryModel>> fetchRepositories(String userName) async {
    try {
      var endpoint = Uri.parse("${Config.API_URL}users/$userName/repos");
      final response = await http.get(endpoint, headers: {
        "Authorization": "Bearer ${Config.API_TOKEN}",
      });
      if (response.statusCode == 200) {
        var decodedList = json.decode(response.body) as List;
        List<RepositoryModel> repositoriesList = decodedList.map((obj) {
          return RepositoryModel.fromJson(obj);
        }).toList();
        return repositoriesList;
      } else {
        throw Exception("API is not successful");
      }
    } on SocketException {
      throw Exception("Socket Exception");
    } on HttpException {
      throw Exception("Http Exception");
    } on FormatException {
      throw Exception("Format Exception");
    } catch (e) {
      throw Exception("unknown exception");
    }
  }
}
