import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../domain/models/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'sign_up_view_model.g.dart';

class SingUpViewModel = _SingUpViewModelBase with _$SingUpViewModel;

abstract class _SingUpViewModelBase with Store {
  UserModel user = UserModel();
  final AuthRepository _authRepository;

  _SingUpViewModelBase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  @observable
  StatusEnum _status = StatusEnum.init;

  @observable
  bool isObscure = true;

  @observable
  bool isObscureConfirmPassWord = true;

  @observable
  String? error;
  @observable
  TextEditingController _confirmPasswordController = TextEditingController();
  @computed
  bool get isFormValid =>
      user.email != null &&
      user.password != null &&
      user.email!.isNotEmpty &&
      user.password!.isNotEmpty;
  @computed
  bool get currentPasswordPassword =>
      _confirmPasswordController.text == user.password;

  StatusEnum get status => _status;

  @action
  void setObscure(bool value) {
    isObscure = value;
  }

  @action
  void setObscureConfirmPassWord(bool value) {
    isObscureConfirmPassWord = value;
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
  void setConfirmPassword(String value) {
    _confirmPasswordController.text = value;
  }

  @action
  Future<void> loginWithGoogle() async {
    setStatus(StatusEnum.loading);
    if (user.email == null || user.password == null) error = null;
    final result = await _authRepository.signInWithGoogle();
    if (result == null) {
      error = 'Invalid email or password';
      setStatus(StatusEnum.error);
      return;
    }
    setStatus(StatusEnum.success);
  }

  @action
  Future<void> loginWithApple() async {}
}
