import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/movie/movie_repository.dart';
import 'package:untold/ui/core/enum/status_enum.dart';
import 'package:video_player/video_player.dart';

import '../../../data/repositories/video_player/video_player_repository.dart';
import '../../../domain/model/subtitle_model.dart';

part 'video_app_view_model.g.dart';

class VideoAppViewModel = _VideoAppViewModelBase with _$VideoAppViewModel;

abstract class _VideoAppViewModelBase with Store {
  final VideoPlayerRepository _repository;
  final RecoverMovieRepository _movieRepository;

  @observable
  late VideoPlayerController _controller;
  @observable
  List<SubtitleModel> subtitles = [];
  @observable
  String selectedAudio = '';
  @observable
  String selectedSubtitle = '';

  @observable
  bool isPlaying = false;
  @observable
  bool openComment = false;
  @observable
  bool openAudio = false;

  @observable
  StatusEnum status = StatusEnum.loading;

  @observable
  bool _showControls = true;
  bool get showControls => _showControls;
  @observable
  Duration position = Duration(seconds: 0);

  _VideoAppViewModelBase(
      {required VideoPlayerRepository repository,
      required RecoverMovieRepository movieRepository})
      : _repository = repository,
        _movieRepository = movieRepository;

  @action
  void toggleControls() {
    if (!openComment) _showControls = !_showControls;
  }

  @action
  void decrease15Seconds() {
    _controller
        .seekTo(_controller.value.position - const Duration(seconds: 15));
  }

  @action
  void increase15Seconds() {
    _controller
        .seekTo(_controller.value.position + const Duration(seconds: 15));
  }

  VideoPlayerController get controller => _controller;
  List<String> get audios =>
      subtitles.map((value) => value.language ?? '').toList();
  List<String> get listSubtitles =>
      subtitles.map((value) => value.language ?? '').toList();

  @action
  void playing() {
    _controller.play();
    isPlaying = true;
    Future.delayed(Duration(seconds: 10)).then((value) {
      _showControls = false;
    });
  }

  @action
  void pause() {
    _controller.pause();
    isPlaying = false;
  }

  @action
  setPosition(Duration value) {
    position = value;
  }

  @action
  Future<void> downloadVideo(String url) async {
    status = StatusEnum.loading;
    _controller = await _repository.call(url);
    status = StatusEnum.success;
    _controller.addListener(() {
      position = _controller.value.position;
    });
  }

  @action
  Future<void> getSubtitles(int moveId) async {
    subtitles = await _movieRepository.getSubtitles(moveId);
    selectedAudio = subtitles.first.language ?? '';
    selectedSubtitle = subtitles.first.language ?? '';
  }

  Future<void> fetchData(String url, int moveId) async {
    await Future.wait([
      downloadVideo(url),
      getSubtitles(moveId),
    ]);
  }
}
