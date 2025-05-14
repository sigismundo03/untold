import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmail(String email, String password);

  Future<User?> registerWithEmail(String email, String password, String username);
 Future<User?> signInWithGoogle();
 

}