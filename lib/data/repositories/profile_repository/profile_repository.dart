import '../../../domain/model/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUser();
  Future<void> editProfile(String name);
  Future<void> userDelete(int? userId);
  Future<void> changePassword(
      {required String password, required String newPassword});
}
