import 'package:untold/domain/model/comment_model.dart';

import '../../../data/repositories/movie/movie_repository.dart';
import '../../../data/repositories/profile_repository/profile_repository.dart';

class CommentViewViewModel {
  final RecoverMovieRepository _repository;
  final ProfileRepository _profileRepository;

  CommentViewViewModel(
      {required RecoverMovieRepository repository,
      required ProfileRepository profileRepository})
      : _repository = repository,
        _profileRepository = profileRepository;

  Stream<List<CommentModel>> getComments(int moveId) =>
      _repository.getComments(moveId);

  Future<void> salveComment(int movieId, String comment) async {
    final result = await _profileRepository.getUser();

    await _repository.saveComment(
      commentText: comment,
      movieId: movieId,
      user: result,
    );
  }
}
