import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untold/data/services/api_client/api_client.dart';

import 'movie_repository.dart';

class RecoverMovieRepositoryImp implements RecoverMovieRepository {
  final ApiClient _apiClient;
  final FirebaseFirestore _firestore;

  const RecoverMovieRepositoryImp(
      {required ApiClient apiClient, required FirebaseFirestore firestore})
      : _apiClient = apiClient,
        _firestore = firestore;

  @override
  Future<void> saveComment() async {
    final commentData = {
      'id': 'uuid',
      'comment': 'commentText',
      'date': DateTime.now().toUtc().toIso8601String(),
      'user': 'user',
      'movie': ' movieId',
    };

    await _firestore.collection('comments').doc('uuid').set(commentData);
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
  Future<void> recoverComments() {
    // TODO: implement recoverComments
    throw UnimplementedError();
  }

  @override
  Future<void> recoverLikes() async {
    final result = await _apiClient.get('/likes?populate=*');
    log(result.toString());
  }

  @override
  Future<void> recoverMovies() async {
    final result = await _apiClient.get('/movies?populate=poster');
    log(result.toString());
  }

  @override
  Future<void> recoverSubtitles() async {
    final result = await _apiClient
        .get('subtitles?populate=file&filters%5Bmovie_id%5D=MOVIE_ID');
    log(result.toString());
  }
}
