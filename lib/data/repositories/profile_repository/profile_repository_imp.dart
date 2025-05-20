import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/model/user_model.dart';
import '../../model/user_response_model.dart';
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
      final data = UserResponseModel.fromJson(response.data);

      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception('User not authenticated');
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
