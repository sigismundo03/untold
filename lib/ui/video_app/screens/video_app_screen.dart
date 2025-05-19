import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:untold/ui/core/di/injection.dart';
import 'package:video_player/video_player.dart';

import '../view_model/video_app_view_model.dart';

class VideoAppScreen extends StatefulWidget {
  const VideoAppScreen({super.key});

  @override
  State<VideoAppScreen> createState() => _VideoAppScreenState();
}

class _VideoAppScreenState extends State<VideoAppScreen> {
  final VideoAppViewModel _viewModel = getIt<VideoAppViewModel>();

  @override
  void initState() {
    super.initState();

    // Força a orientação horizontal ao abrir
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _viewModel.downloadVideo(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
  }

  @override
  void dispose() {
    _viewModel.controller.dispose();

    // Volta para orientação normal ao sair
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Observer(builder: (context) {
        return GestureDetector(
          onTap: _viewModel.toggleControls,
          child: _viewModel.status.isSuccess
              ? Observer(builder: (context) {
                  return Stack(
                    children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: _viewModel.controller.value.aspectRatio,
                          child: VideoPlayer(_viewModel.controller),
                        ),
                      ),
                      _viewModel.showControls
                          ? VideoOverlayWidget(
                              controller: _viewModel.controller,
                              position: _viewModel.position,
                              increase15Seconds: _viewModel.increase15Seconds,
                              decrease15Seconds: _viewModel.decrease15Seconds,
                              isPlaying: _viewModel.isPlaying,
                              play: () {
                                _viewModel.isPlaying
                                    ? _viewModel.pause()
                                    : _viewModel.playing();
                              },
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                })
              : const Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}

class VideoOverlayWidget extends StatelessWidget {
  const VideoOverlayWidget({
    super.key,
    required this.controller,
    required this.position,
    this.increase15Seconds,
    this.decrease15Seconds,
    required this.play,
    required this.isPlaying,
  });
  final VideoPlayerController controller;
  final Duration position;
  final Function()? increase15Seconds;
  final Function()? decrease15Seconds;
  final Function()? play;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration d) {
      final hours = d.inHours;
      final minutes = d.inMinutes.remainder(60);
      final seconds = d.inSeconds.remainder(60);
      if (hours > 0) {
        return '${hours.toString().padLeft(1, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      }
    }

    return Positioned.fill(
      child: Container(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text("Barbie",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  const Spacer(),
                  const Icon(Icons.subtitles, color: Colors.white),
                  const SizedBox(width: 16),
                  const Icon(Icons.comment, color: Colors.white),
                ],
              ),
            ),

            // Middle controls
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10,
                      size: 36, color: Colors.white),
                  onPressed: decrease15Seconds,
                ),
                Observer(builder: (context) {
                  return IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                      size: 64,
                      color: Colors.white,
                    ),
                    onPressed: play,
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.forward_10,
                      size: 36, color: Colors.white),
                  onPressed: increase15Seconds,
                ),
              ],
            ),

            // Progress and duration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: VideoProgressIndicator(
                      controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Colors.purpleAccent,
                        backgroundColor: Colors.white30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${formatDuration(position)} ',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.subtitles, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
