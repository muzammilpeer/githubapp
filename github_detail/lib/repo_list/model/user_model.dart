class UserModel {
  final String userName;
  final String name;
  final String email;
  final String avatarUrl;

  UserModel(
      {required this.userName,
      required this.name,
      required this.email,
      required this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userName: json['userName'],
        name: json['name'],
        email: json['email'],
        avatarUrl: json['avatarUrl']);
  }
}
