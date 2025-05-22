import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untold/data/services/api_client/api_client.dart';
import 'package:untold/domain/model/comment_model.dart';
import 'package:untold/domain/model/user_model.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/model/movie_model.dart';
import '../../../domain/model/subtitle_model.dart';
import '../../model/movie_response_model.dart';
import '../../model/subtitle_response_model.dart';
import 'movie_repository.dart';

class RecoverMovieRepositoryImp implements RecoverMovieRepository {
  final ApiClient _apiClient;
  final FirebaseFirestore _firestore;

  const RecoverMovieRepositoryImp(
      {required ApiClient apiClient, required FirebaseFirestore firestore})
      : _apiClient = apiClient,
        _firestore = firestore;

  @override
  Future<void> saveComment({
    required int movieId,
    required String commentText,
    required UserModel user,
  }) async {
    try {
      final commentId = const Uuid().v4();
      final commentData = {
        'id': commentId,
        'comment': commentText,
        'date': DateTime.now().toUtc().toIso8601String(),
        'user': user.toJson(),
        'movie': movieId,
      };

      await _firestore.collection('comments').doc(commentId).set(commentData);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> dislike() async {
    await _apiClient.delete('likes/LIKE_ID');
  }

  @override
  Future<void> saveLike() async {
    final result = await _apiClient.post(
      '/likes',
      body: {
        "movie_id": 1,
        "user_id": 19,
      },
    );
    log(result.toString());
  }

  @override
  Stream<List<CommentModel>> getComments(int movieId) {
    final result = _firestore.collection('comments').snapshots();

    return result.map((snapshot) =>
        snapshot.docs.map((doc) => CommentModel.fromJson(doc.data())).toList());
  }

  @override
  Future<void> getLikes() async {
    final result = await _apiClient.get('/likes?populate=*');
    log(result.toString());
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final result = await _apiClient.get('/movies?populate=poster');
      final data = MovieResponseModel.fromJson(result.data);

      final movie =
          data.data?.map((movie) => MovieModel.fromJson(movie)).toList();
      return movie ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SubtitleModel>> getSubtitles(int movieId) async {
    final result = await _apiClient
        .get('/subtitles?populate=file&filters%5Bmovie_id%5D=$movieId');
    final data = SubtitleResponseModel.fromJson(result.data);
    final subtitle = data.data
        ?.map((subtitle) => SubtitleModel.fromJson(subtitle.attributes))
        .toList();
    return subtitle ?? [];
  }
}
