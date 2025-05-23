import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/profile_repository/profile_repository.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../domain/model/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  @observable
  UserModel user = UserModel();
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  @observable
  StatusEnum _status = StatusEnum.init;
  @observable
  StatusEnum _statusDeleteUser = StatusEnum.init;

  @observable
  StatusEnum _statusButton = StatusEnum.init;

  _ProfileViewModelBase(
      {required AuthRepository authRepository,
      required ProfileRepository profileRepository})
      : _authRepository = authRepository,
        _profileRepository = profileRepository;
  @computed
  StatusEnum get status => _status;

  @computed
  StatusEnum get statusButton => _statusButton;
  @computed
  StatusEnum get statusDeleteUser => _statusDeleteUser;

  @action
  Future<void> getUser() async {
    _status = StatusEnum.loading;
    try {
      user = await _profileRepository.getUser();
      _status = StatusEnum.success;
    } catch (e) {
      _status = StatusEnum.error;
    }
  }

  @action
  Future<void> deleteUser() async {
    _statusDeleteUser = StatusEnum.loading;
    try {
      await _profileRepository.userDelete(user.id );
      await logout();
      _statusDeleteUser = StatusEnum.success;
    } catch (e) {
      _statusDeleteUser = StatusEnum.error;
    }
  }

  @action
  Future<void> logout() async {
    _statusButton = StatusEnum.loading;
    await _authRepository.logout();
    _statusButton = StatusEnum.success;
  }
}
