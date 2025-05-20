import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untold/domain/model/movie_model.dart';
import 'package:untold/ui/core/di/injection.dart';
import 'package:video_player/video_player.dart';

import '../view_model/video_app_view_model.dart';
import '../widgets/audio_subtitle_widget.dart';
import '../widgets/comment_widget.dart';

class VideoAppScreen extends StatefulWidget {
  const VideoAppScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<VideoAppScreen> createState() => _VideoAppScreenState();
}

class _VideoAppScreenState extends State<VideoAppScreen> {
  final VideoAppViewModel _viewModel = getIt<VideoAppViewModel>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _viewModel.fetchData(
      widget.movie.streamLink,
      widget.movie.id,
    );
  }

  @override
  void dispose() {
    _viewModel.controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Observer(builder: (context) {
        if (_viewModel.openAudio) {
          return AudioSubtitleWidget(
            audios: _viewModel.audios,
            subtitles: _viewModel.listSubtitles,
            selectedSubtitle: _viewModel.selectedSubtitle,
            onSelectAudio: (value) {
              _viewModel.selectedAudio = value;
            },
            onSelectSubtitle: (value) {
              _viewModel.selectedSubtitle = value;
            },
            selectedAudio: _viewModel.selectedAudio,
            onPressedClose: () {
              _viewModel.openAudio = false;
            },
          );
        }
        return SafeArea(
          child: GestureDetector(
            onTap: _viewModel.toggleControls,
            child: _viewModel.status.isSuccess
                ? Observer(builder: (context) {
                    return Stack(
                      children: [
                        Center(
                          child: AspectRatio(
                            aspectRatio:
                                _viewModel.controller.value.aspectRatio,
                            child: VideoPlayer(_viewModel.controller),
                          ),
                        ),
                        _viewModel.showControls
                            ? Observer(builder: (context) {
                                return VideoOverlayWidget(
                                  title: widget.movie.name,
                                  controller: _viewModel.controller,
                                  position: _viewModel.position,
                                  increase15Seconds:
                                      _viewModel.increase15Seconds,
                                  decrease15Seconds:
                                      _viewModel.decrease15Seconds,
                                  isPlaying: _viewModel.isPlaying,
                                  openComment: _viewModel.openComment,
                                  moveId: widget.movie.id,
                                  onPressedClose: () {
                                    _viewModel.openComment = false;
                                  },
                                  onTapComment: () {
                                    _viewModel.openComment = true;
                                  },
                                  onTapCaption: () {
                                    _viewModel.openAudio = true;
                                  },
                                  play: () {
                                    _viewModel.isPlaying
                                        ? _viewModel.pause()
                                        : _viewModel.playing();
                                  },
                                );
                              })
                            : const SizedBox.shrink(),
                      ],
                    );
                  })
                : const Center(child: CircularProgressIndicator()),
          ),
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
    required this.title,
    required this.openComment,
    required this.onPressedClose,
    required this.onTapComment,
    required this.onTapCaption,
    required this.moveId,
  });
  final VideoPlayerController controller;
  final Duration position;
  final Function()? increase15Seconds;
  final Function()? decrease15Seconds;
  final Function()? play;
  final bool isPlaying;
  final String title;
  final bool openComment;
  final Function()? onPressedClose;
  final Function()? onTapComment;
  final Function()? onTapCaption;
  final int moveId;

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
        color: const Color.fromARGB(96, 10, 10, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Bar
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                color: Color.fromRGBO(170, 115, 240, 1)),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: onTapCaption,
                            child: Row(
                              spacing: 8,
                              children: [
                                SvgPicture.asset(
                                  'assets/caption.svg',
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                                Text('subtitles / audio'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: onTapComment,
                            child: Row(
                              spacing: 8,
                              children: [
                                SvgPicture.asset(
                                  'assets/uil_comment.svg',
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                                Text('Comments 324'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),

                    // Middle controls
                    Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/iconoir_backward-15-seconds.svg',
                            colorFilter:
                                ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          onPressed: decrease15Seconds,
                        ),
                        Observer(builder: (context) {
                          return IconButton(
                            icon: Icon(
                              isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              size: 64,
                              color: Colors.white,
                            ),
                            onPressed: play,
                          );
                        }),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/iconoir_forward-15-seconds.svg',
                            colorFilter:
                                ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          onPressed: increase15Seconds,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),

                    // Progress and duration
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
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
                          SvgPicture.asset('assets/fluent_full-screen.svg',
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (openComment)
                CommentWidget(
                  onPressedClose: onPressedClose,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.34,
                  moveId: moveId,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
