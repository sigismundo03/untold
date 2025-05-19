import 'package:mobx/mobx.dart';
import 'package:untold/ui/core/enum/status_enum.dart';
import 'package:video_player/video_player.dart';

import '../../../data/repositories/video_player/video_player_repository.dart';

part 'video_app_view_model.g.dart';

class VideoAppViewModel = _VideoAppViewModelBase with _$VideoAppViewModel;

abstract class _VideoAppViewModelBase with Store {
  final VideoPlayerRepository _repository;

  @observable
  late VideoPlayerController _controller;
  @observable
  bool isPlaying = false;

  @observable
  StatusEnum status = StatusEnum.loading;

  @observable
  bool _showControls = true;
  bool get showControls => _showControls;
  @observable
  Duration position = Duration(seconds: 0);

  _VideoAppViewModelBase({required VideoPlayerRepository repository})
      : _repository = repository;

  @action
  void toggleControls() {
    _showControls = !_showControls;
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
}
