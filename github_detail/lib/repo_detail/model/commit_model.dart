import 'package:intl/intl.dart';
class CommitModel {
  final String message;
  final String committerName;
  final String committerAvatarUrl;
  final String timestamp;
  final bool isBuildSuccess;
  final String buildRuns;
  final bool isVerified;
  final String commitHash;
  final String commitUrl;

  CommitModel(
      {required this.message,
      required this.committerName,
      required this.committerAvatarUrl,
      required this.timestamp,
      required this.isBuildSuccess,
      required this.buildRuns,
      required this.isVerified,
      required this.commitHash,
      required this.commitUrl});

  static String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('MMM, d yyyy').format(dateTime);
  }

  factory CommitModel.fromJson(Map<String, dynamic> json) {
    Map commit = json['commit'];
    Map committer = json['committer'];
    Map author = json['author'];

    CommitModel model = CommitModel(
      message: commit['message'],
      committerName: committer['login'],
      committerAvatarUrl: author['avatar_url'],
      timestamp: formatDate(commit["committer"]['date']),
      isBuildSuccess: commit['verification']['verified'],
      buildRuns: "1/1",
      isVerified: commit['verification']['verified'],
      commitHash: json['sha'].substring(0, 7),
      commitUrl: json['html_url'],
    );

    return model;
  }
}
