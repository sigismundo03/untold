import 'package:video_player/video_player.dart';

import 'video_player_repository.dart';

class VideoPlayerRepositoryImp implements VideoPlayerRepository {
  @override
  Future<VideoPlayerController> call(String url) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller.initialize();
    return controller;
  }

}
