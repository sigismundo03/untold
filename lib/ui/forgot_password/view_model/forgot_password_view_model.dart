import 'package:mobx/mobx.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../domain/model/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  @observable
  UserModel user = UserModel();
  final AuthRepository _authRepository;

  _ForgotPasswordViewModelBase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @observable
  StatusEnum _status = StatusEnum.init;

  @computed
  StatusEnum get status => _status;

  @action
  void setStatus(StatusEnum value) {
    _status = value;
  }

  @action
  void setEmail(String value) {
    user = user.copyWith(email: value);
  }

  @action
  void setUser(UserModel value) {
    user = value;
  }

  @action
  Future<void> sendPasswordResetEmail() async {
    setStatus(StatusEnum.loading);
    try {
      await _authRepository.sendPasswordResetEmail(user.email!);
      setStatus(StatusEnum.success);
    } catch (e) {
      setStatus(StatusEnum.error);
    }
  }
}
