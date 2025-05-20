import '../../data/model/movie_response_model.dart';

class MovieModel {
  final int id;
  final String name;
  final String synopsis;
  final String streamLink;

  final String genre;
  final String thumbnail;

  MovieModel({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.streamLink,
    required this.genre,
    required this.thumbnail,
  });

  factory MovieModel.fromJson(
    MovieDataModel movies,
  ) {
    return MovieModel(
      id: movies.id ?? 0,
      name: movies.attributes?.name ?? '',
      synopsis: movies.attributes?.synopsis ?? '',
      streamLink: movies.attributes?.streamLink ?? '',
      genre: movies.attributes?.genre ?? '',
      thumbnail: movies
              .attributes?.poster?.data.attributes.formats?.large?.url ??
          'https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_1280.png',
    );
  }
}
