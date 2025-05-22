import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/model/user_model.dart';
import '../../../ui/core/enum/preference_keys_enum.dart';
import '../../model/user_response_model.dart';
import '../../services/api_client/api_client.dart';
import '../../services/shared_prefs_helper/shared_preference_helper.dart';
import 'profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ApiClient _apiClient;
  final FirebaseAuth _auth;

  final SharedPreferenceHelper _sharedPreferenceHelper;

  ProfileRepositoryImp({
    required ApiClient apiClient,
    required FirebaseAuth auth,
    required SharedPreferenceHelper sharedPreferenceHelper,
  })  : _apiClient = apiClient,
        _auth = auth,
        _sharedPreferenceHelper = sharedPreferenceHelper;

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await _apiClient.get('/users/me');

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch user');
      }
      final data = UserResponseModel.fromJson(response.data);

      return UserModel.fromJsonUserResponse(data);
    } catch (e) {
      throw Exception('User not authenticated');
    }
  }

  @override
  Future<void> editProfile(String name) async {
    await _apiClient.patch('/users/updateMe', body: {
      'data': {'username': name},
    });
  }

  @override
  Future<void> userDelete(int? userId) async {
    if (userId == null) {
      throw Exception('User not authenticated');
    }
    try {
      final email =
          _sharedPreferenceHelper.getString(PreferenceKeysEnum.userEmail.name);
      final password = _sharedPreferenceHelper
          .getString(PreferenceKeysEnum.userPassword.name);

      if (email != null && password != null) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      await _apiClient.delete('/users/$userId');
      await _auth.currentUser?.delete();
    } catch (e) {
      throw Exception('User not authenticated');
    }
  }

  @override
  Future<void> changePassword(
      {required String password, required String newPassword}) async {
    final email =
        _sharedPreferenceHelper.getString(PreferenceKeysEnum.userEmail.name);
    if (email != null) {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
    final user = _auth.currentUser;

    if (user != null) {
      await user.updatePassword(newPassword);
      await _apiClient.patch('/users/updateMe', body: {
        'data': {'password': newPassword},
      });
    } else {
      throw Exception('User not authenticated');
    }
  }
}
