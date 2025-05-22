import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/domain/model/user_model.dart';

import '../../core/enum/status_enum.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  UserModel user = UserModel();
  final AuthRepository _authRepository;

  _LoginViewModelBase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @observable
  StatusEnum _status = StatusEnum.init;

  @observable
  bool isObscure = true;

  @observable
  String? error;

  @computed
  StatusEnum get status => _status;

  @computed
  bool get isFormValid =>
      user.email != null &&
      user.password != null &&
      user.email!.isNotEmpty &&
      user.password!.isNotEmpty;

  @action
  void setObscure(bool value) {
    isObscure = value;
  }

  @action
  void setStatus(StatusEnum value) {
    _status = value;
  }

  @action
  void setError(String? value) {
    error = value;
  }

  @action
  void setEmail(String value) {
    user = user.copyWith(email: value);
  }

  @action
  void setPassword(String value) {
    user = user.copyWith(password: value);
  }

  @action
  Future<void> login() async {
    setStatus(StatusEnum.loading);

    error = null;
    if (user.email == null || user.password == null) {
      error = 'Invalid email or password';
      setStatus(StatusEnum.error);
      return;
    }
    try {
      final result =
          await _authRepository.signInWithEmail(user.email!, user.password!);
      if (result == null) {
        error = 'Invalid email or password';
        setStatus(StatusEnum.error);
        return;
      }
      setStatus(StatusEnum.success);
    } catch (e) {
      setStatus(StatusEnum.error);
    }
  }

  @action
  Future<void> loginWithGoogle() async {
    setStatus(StatusEnum.loading);
    error = null;
    final result = await _authRepository.signInWithGoogle();
    if (result == null) {
      setStatus(StatusEnum.error);
    }

    setStatus(StatusEnum.success);
  }

  @action
  Future<void> loginWithApple() async {}
}
