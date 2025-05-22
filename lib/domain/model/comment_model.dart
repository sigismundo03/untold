import 'package:untold/domain/model/user_model.dart';

class CommentModel {
  final String? id;
  final String? comment;
  final String? date;
  final UserModel? user;
  final String? movieId;

  CommentModel({
    required this.id,
    required this.comment,
    required this.date,
    required this.user,
    required this.movieId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? '',
      comment: json['comment'] ?? 'No comment',
      date: json['date'] ??
          DateTime.now()
              .subtract(const Duration(days: 1))
              .toUtc()
              .toIso8601String(),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      movieId: json['movie'] != null ? json['movie'].toString() : '1',
    );
  }
  String timeAgoFromString(String? dateString) {
    if (dateString == null) {
      return '2 weeks ago';
    }

    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final diff = now.difference(date);

    final List<MapEntry<Duration, String>> units = [
      MapEntry(Duration(seconds: 60), 'second'),
      MapEntry(Duration(minutes: 60), 'minute'),
      MapEntry(Duration(hours: 24), 'hour'),
      MapEntry(Duration(days: 7), 'day'),
      MapEntry(Duration(days: 30), 'week'),
      MapEntry(Duration(days: 365), 'month'),
    ];

    for (var i = 0; i < units.length; i++) {
      final current = units[i].key;
      final label = units[i].value;

      if (diff < current) {
        final previous = i == 0 ? Duration(seconds: 1) : units[i - 1].key;
        final value = diff.inSeconds ~/ previous.inSeconds;
        return '$value $label${value == 1 ? '' : 's'} ago';
      }
    }

    final years = diff.inDays ~/ 365;
    return '$years year${years == 1 ? '' : 's'} ago';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
        'date': date,
        'user': user?.toJson(),
        'movie_id': movieId,
      };
}
