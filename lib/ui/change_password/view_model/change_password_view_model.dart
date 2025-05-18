import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/profile_repository/profile_repository.dart';

import '../../../domain/models/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'change_password_view_model.g.dart';

class ChangePasswordViewModel = _ChangePasswordViewModelBase
    with _$ChangePasswordViewModel;

abstract class _ChangePasswordViewModelBase with Store {
  @observable
  UserModel user = UserModel();
  final ProfileRepository _profileRepository;

  String _passWord = '';

  String _newPassWord = '';

  @observable
  bool isObscure = true;

  @observable
  bool isObscureConfirmPassWord = true;

  @observable
  bool isObscureConfirmNewPassWord = true;

  @observable
  StatusEnum _status = StatusEnum.init;

  @computed
  StatusEnum get status => _status;

  _ChangePasswordViewModelBase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;
  @action
  void setStatus(StatusEnum value) {
    _status = value;
  }

  @action
  void setObscure(bool value) {
    isObscure = value;
  }


  @action
  void setObscureConfirmPassWord(bool value) {
    isObscureConfirmPassWord = value;
  }

  @action
  void setObscureConfirmNewPassWord(bool value) {
    isObscureConfirmNewPassWord = value;
  }

  @action
  void setPassword(String value) {
    _passWord = value;
  }

  void setNewPassword(String value) {
    _newPassWord = value;
  }

  void setConfirmPassword(String value) {
    user = user.copyWith(password: value);
  }

  @computed
  bool get validPassword =>
      _passWord != _newPassWord &&
      _newPassWord == user.password &&
      _passWord.trim().isNotEmpty &&
      _newPassWord.trim().isNotEmpty &&
      user.password!.trim().isNotEmpty;

  @action
  Future<void> changePassword() async {
    setStatus(StatusEnum.loading);
    try {
      await _profileRepository.changePassword(user.password!);

      setStatus(StatusEnum.success);
    } catch (e) {
      setStatus(StatusEnum.error);
    }
  }
}
