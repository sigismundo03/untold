import 'package:video_player/video_player.dart';

abstract class VideoPlayerRepository {
  Future<VideoPlayerController> call(String url);
}
