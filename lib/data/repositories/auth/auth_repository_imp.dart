import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../ui/core/enum/preference_keys_enum.dart';
import '../../services/api_client/api_client.dart';
import '../../services/shared_prefs_helper/shared_preference_helper.dart';
import 'auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final FirebaseAuth _auth;
  final ApiClient _apiClient;
  final GoogleSignIn _googleSignIn;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  AuthRepositoryImp(
      {required FirebaseAuth auth,
      required ApiClient apiClient,
      required GoogleSignIn googleSignIn,
      required SharedPreferenceHelper sharedPreferenceHelper})
      : _auth = auth,
        _apiClient = apiClient,
        _googleSignIn = googleSignIn,
        _sharedPreferenceHelper = sharedPreferenceHelper;

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _sharedPreferenceHelper.setString(
        PreferenceKeysEnum.userEmail.name,
        email,
      );
      _sharedPreferenceHelper.setString(
        PreferenceKeysEnum.userPassword.name,
        password,
      );

      return credential.user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<User?> registerWithEmail(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        await _apiClient.post(
          '/auth/local/register',
          body: {
            'username': username,
            'email': email,
            'password': password,
            'firebase_UID': user.uid,
          },
          hasNoToken: true,
        );
        _sharedPreferenceHelper.setString(
          PreferenceKeysEnum.userEmail.name,
          email,
        );
        _sharedPreferenceHelper.setString(
          PreferenceKeysEnum.userPassword.name,
          password,
        );
        finishOnboarding();
      }
      return user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        try {
          await _apiClient.post(
            '/auth/local/register',
            body: {
              'username': user.displayName ?? 'Google User',
              'email': user.email,
              'password': 'google_${user.uid}',
              'firebase_UID': user.uid,
            },
            hasNoToken: true,
          );
        } catch (e) {
          throw Exception('Registration failed: $e');
        }
      }
      finishOnboarding();
      return user;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  @override
  Future<void> finishOnboarding() async {
    final result = await _apiClient.patch('/users/updateMe', body: {
      'data': {'finished_onboarding': true},
    });
    log(result.toString());
  }

  @override
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }
}
