import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../services/api_client/api_client.dart';
import 'auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final FirebaseAuth _auth;
  final ApiClient _apiClient;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImp(
      {required FirebaseAuth auth,
      required ApiClient apiClient,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _apiClient = apiClient,
        _googleSignIn = googleSignIn;

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
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

  // Finalizar Onboarding
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
      return true;
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
