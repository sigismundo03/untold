import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untold/domain/model/movie_model.dart';
import 'package:untold/ui/core/widgets/primary_button_widget.dart';
import 'package:untold/ui/home/view_model/home_view_model.dart';

import '../../../data/services/share/share_service.dart';
import '../../../routing/app_routes.dart';
import '../../core/di/injection.dart';
import '../widgets/custom_shimmer_loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _viewModel = getIt<HomeViewModel>();

  @override
  void initState() {
    _viewModel.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(75, 36, 114, 1),
              Color.fromRGBO(124, 124, 124, 1),
            ],
          ),
        ),
        child: Observer(builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SvgPicture.asset(
                        "assets/small_logo.svg",
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 46, right: 16),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_960_720.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _viewModel.status.isLoading
                  ? Expanded(
                      child: CustomShimmerLoadingWidget(
                        height: height,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: Text(
                                      'Now Showing',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  MovieCardWidget(
                                    height: height,
                                    movie: _viewModel.movies[index],
                                  ),
                                ],
                              );
                            }

                            return MovieCardWidget(
                              height: height,
                              movie: _viewModel.movies[index],
                            );
                          }),
                    ),
            ],
          );
        }),
      ),
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.height,
    required this.movie,
  });

  final double height;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: height * 0.82,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
            image: NetworkImage(
              movie.thumbnail,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 1),
                SizedBox(height: 1),
                SizedBox(height: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.genre,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      movie.synopsis,
                      style: TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Comments 1.322',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 8,
                            backgroundColor: Color.fromRGBO(217, 217, 217, 1)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, connect...',
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: PrimaryButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.videoApp,
                              arguments: movie);
                        },
                        text: 'Watch',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      thickness: 1,
                      color: Color.fromRGBO(217, 217, 217, 1),
                      endIndent: 1,
                      indent: 1,
                      height: 1,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(children: [
                              ReactWidget(),
                            ]),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ShareService.sharePosterUrl(
                                      description: movie.synopsis,
                                      posterUrl: movie.thumbnail,
                                      title: movie.name,
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    'assets/share.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Text(
                                  'Gift to someone?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Available until',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.45),
                              ),
                            ),
                            Text(
                              'Fev 29, 2023',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(170, 115, 240, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReactWidget extends StatefulWidget {
  const ReactWidget({
    super.key,
  });

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  Reaction<String> _selectedReaction = const Reaction<String>(
    value: null,
    icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return ReactionButton<String>(
      onReactionChanged: (reaction) {
        if (reaction?.value == 'close') {
          // Ao clicar no botão de fechar, volta para o estado inicial
          setState(() {
            _selectedReaction = const Reaction<String>(
              value: null,
              icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
            );
          });
        } else {
          // Define a reação normalmente
          setState(() {
            _selectedReaction = reaction!;
          });
        }
      },
      reactions: [
        Reaction<String>(
          value: 'not_for_me',
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.thumb_down_alt_outlined, color: Colors.white),
              SizedBox(height: 4),
              Text("It’s not for me",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
        ),
        Reaction<String>(
          value: 'like_it',
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
              SizedBox(height: 4),
              Text("I like it",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
        ),
        Reaction<String>(
          value: 'Rate',
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.thumb_up_alt, color: Colors.white),
              SizedBox(height: 4),
              Text("I love it!",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
        ),
        Reaction<String>(
          value: 'close',
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purpleAccent),
            ),
            padding: const EdgeInsets.all(4),
            child:
                const Icon(Icons.close, color: Colors.purpleAccent, size: 16),
          ),
        ),
      ],
      placeholder: _selectedReaction,
      boxColor: const Color.fromRGBO(0, 0, 0, 0.6),
      boxRadius: 40,
      itemSize: const Size(70, 60),
      itemsSpacing: 12,
    );
  }
}
