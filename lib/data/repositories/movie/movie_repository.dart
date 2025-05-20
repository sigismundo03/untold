import 'package:untold/domain/model/comment_model.dart';

import '../../../domain/model/movie_model.dart';
import '../../../domain/model/subtitle_model.dart';
import '../../../domain/model/user_model.dart';

abstract class RecoverMovieRepository {
  Future<List<MovieModel>> getMovies();
  Future<void> getLikes();
  Stream<List<CommentModel>> getComments(int movieId);
  Future<void> saveLike();
  Future<void> saveComment({
    required int movieId,
    required String commentText,
    required UserModel user,
  });
  Future<void> dislike();
  Future<List<SubtitleModel>> getSubtitles(int movieId);
}
