import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmail(String email, String password);

  Future<User?> registerWithEmail({
    required String email,
    required String password,
    required String username,
  });
  Future<User?> signInWithGoogle();
}
