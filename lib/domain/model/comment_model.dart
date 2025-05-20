
import 'package:untold/domain/model/user_model.dart';




class CommentModel {
  final String id;
  final String comment;
  final String date;
  final UserModel user;
  final String movieId;

  CommentModel({
    required this.id,
    required this.comment,
    required this.date,
    required this.user,
    required this.movieId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comment: json['comment'],
      date: json['date'],
      user: UserModel.fromJson(json['user']),
      movieId: json['movie_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'comment': comment,
    'date': date,
    'user': user.toJson(),
    'movie_id': movieId,
  };
}
