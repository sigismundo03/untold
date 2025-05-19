import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/model/user_model.dart';
import '../../services/api_client/api_client.dart';
import 'profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ApiClient _apiClient;
  final FirebaseAuth _auth;

  ProfileRepositoryImp(
      {required ApiClient apiClient, required FirebaseAuth auth})
      : _apiClient = apiClient,
        _auth = auth;

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await _apiClient.get('/users/me');

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch user');
      }
      log('message: ${response.toString()}');
      return UserModel(
          id: '1',
          name: 'John Doe',
          email: 'john.doe@example.com',
          photoUrl:
              'https://cdn.pixabay.com/photo/2021/10/27/19/09/cat-6748193_1280.jpg');
    } catch (e) {
      return UserModel(
          id: '1',
          name: 'John Doe',
          email: 'john.doe@example.com',
          photoUrl:
              'https://cdn.pixabay.com/photo/2021/10/27/19/09/cat-6748193_1280.jpg');
    }
  }

  @override
  Future<void> editProfile(String name) async {
    await _apiClient.patch('/users/updateMe', body: {
      'data': {'name': name},
    });
  }

  @override
  Future<void> userDelete(String userId) async {
    await _auth.currentUser?.delete();
    await _apiClient.delete('/users/$userId');
  }

  @override
  Future<void> changePassword(String password) async {
    final user = _auth.currentUser;

    if (user != null) {
      await user.updatePassword(password);
      await _apiClient.patch('/users/updateMe', body: {
        'data': {'password': password},
      });
    } else {
      throw Exception('User not authenticated');
    }
  }
}
