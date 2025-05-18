import '../../../domain/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUser();
  Future<void> editProfile(String name);
  Future<void> userDelete(String userId);
  Future<void> changePassword(String password);

}
