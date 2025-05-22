import 'package:mobx/mobx.dart';
import 'package:untold/domain/model/comment_model.dart';
import 'package:untold/domain/model/user_model.dart';

import '../../../data/repositories/movie/movie_repository.dart';
import '../../../data/repositories/profile_repository/profile_repository.dart';

part 'comment_view_model.g.dart';

class CommentViewModel = _CommentViewModelBase with _$CommentViewModel;

abstract class _CommentViewModelBase with Store {
  final RecoverMovieRepository _repository;
  final ProfileRepository _profileRepository;
  @observable
  String comment = '';
  @observable
  UserModel user = UserModel();

  _CommentViewModelBase(
      {required RecoverMovieRepository repository,
      required ProfileRepository profileRepository})
      : _repository = repository,
        _profileRepository = profileRepository;

  Stream<List<CommentModel>> getComments(int moveId) =>
      _repository.getComments(moveId);
  @action
  Future<void> getUser() async {
    user = await _profileRepository.getUser();
  }

  Future<void> salveComment(int movieId, String comment) async {
    await _repository.saveComment(
      commentText: comment,
      movieId: movieId,
      user: user,
    );
  }

  void setComment(String comment) {
    this.comment = comment;
  }
}
