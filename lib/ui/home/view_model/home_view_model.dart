// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:untold/domain/model/movie_model.dart';
import 'package:untold/ui/core/enum/status_enum.dart';

import '../../../data/repositories/movie/movie_repository.dart';
import '../../../domain/model/user_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  UserModel user = UserModel();
  @observable
  List<MovieModel> movies = [];
  @observable
  StatusEnum status = StatusEnum.init;

  RecoverMovieRepository _movieRepository;
  _HomeViewModelBase({
    required RecoverMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @action
  Future<void> getMovies() async {
    status = StatusEnum.loading;

    movies = await _movieRepository.getMovies();
    status = StatusEnum.success;
  }
}
