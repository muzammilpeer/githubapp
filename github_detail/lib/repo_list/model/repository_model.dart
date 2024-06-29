class Owner {
  String login;
  String avatarUrl;

  Owner({required this.login, required this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) {
    Owner owner = Owner(login: json['login'], avatarUrl: json['avatar_url']);
    return owner;
  }
}

class RepositoryModel {
  String name;
  String? description;
  String pushedAt;
  String? language;
  int starsCount;
  int forksCount;
  int watchersCount;
  int issuesCount;
  String visibility;
  Owner owner;

  RepositoryModel(
      {required this.name,
      required this.description,
      required this.pushedAt,
      required this.language,
      required this.starsCount,
      required this.forksCount,
      required this.watchersCount,
      required this.issuesCount,
      required this.visibility,
      required this.owner});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    RepositoryModel? model = null;
    try {
      model = RepositoryModel(
          name: json['name'],
          description: json['description'],
          pushedAt: json['pushed_at'],
          language: json['language'],
          starsCount: json['stargazers_count'],
          forksCount: json['forks_count'],
          watchersCount: json['watchers_count'],
          issuesCount: json['open_issues_count'],
          visibility: json['visibility'],
          owner: Owner.fromJson(json['owner']));
      return model;
    } catch (e) {
      print("error exception RepositoryModel: $e");
    }


    return model!;
  }
}
