import '../../../domain/model/movie_model.dart';
import '../../../domain/model/subtitle_model.dart';

abstract class RecoverMovieRepository {
  Future<List<MovieModel>> getMovies();
  Future<void> getLikes();
  Future<void> getComments();
  Future<void> saveLike();
  Future<void> saveComment();
  Future<void> dislike();
  Future<List<SubtitleModel>> getSubtitles(String movieId);
}
