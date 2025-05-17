// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingUpViewModel on _SingUpViewModelBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SingUpViewModelBase.isFormValid'))
          .value;
  Computed<bool>? _$currentPasswordPasswordComputed;

  @override
  bool get currentPasswordPassword => (_$currentPasswordPasswordComputed ??=
          Computed<bool>(() => super.currentPasswordPassword,
              name: '_SingUpViewModelBase.currentPasswordPassword'))
      .value;

  late final _$_statusAtom =
      Atom(name: '_SingUpViewModelBase._status', context: context);

  @override
  StatusEnum get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(StatusEnum value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$isObscureAtom =
      Atom(name: '_SingUpViewModelBase.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$isObscureConfirmPassWordAtom = Atom(
      name: '_SingUpViewModelBase.isObscureConfirmPassWord', context: context);

  @override
  bool get isObscureConfirmPassWord {
    _$isObscureConfirmPassWordAtom.reportRead();
    return super.isObscureConfirmPassWord;
  }

  @override
  set isObscureConfirmPassWord(bool value) {
    _$isObscureConfirmPassWordAtom
        .reportWrite(value, super.isObscureConfirmPassWord, () {
      super.isObscureConfirmPassWord = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SingUpViewModelBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_confirmPasswordControllerAtom = Atom(
      name: '_SingUpViewModelBase._confirmPasswordController',
      context: context);

  @override
  TextEditingController get _confirmPasswordController {
    _$_confirmPasswordControllerAtom.reportRead();
    return super._confirmPasswordController;
  }

  @override
  set _confirmPasswordController(TextEditingController value) {
    _$_confirmPasswordControllerAtom
        .reportWrite(value, super._confirmPasswordController, () {
      super._confirmPasswordController = value;
    });
  }

  late final _$loginWithGoogleAsyncAction =
      AsyncAction('_SingUpViewModelBase.loginWithGoogle', context: context);

  @override
  Future<void> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  late final _$loginWithAppleAsyncAction =
      AsyncAction('_SingUpViewModelBase.loginWithApple', context: context);

  @override
  Future<void> loginWithApple() {
    return _$loginWithAppleAsyncAction.run(() => super.loginWithApple());
  }

  late final _$_SingUpViewModelBaseActionController =
      ActionController(name: '_SingUpViewModelBase', context: context);

  @override
  void setObscure(bool value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setObscure');
    try {
      return super.setObscure(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureConfirmPassWord(bool value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setObscureConfirmPassWord');
    try {
      return super.setObscureConfirmPassWord(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(StatusEnum value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_SingUpViewModelBaseActionController.startAction(
        name: '_SingUpViewModelBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SingUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscure: ${isObscure},
isObscureConfirmPassWord: ${isObscureConfirmPassWord},
error: ${error},
isFormValid: ${isFormValid},
currentPasswordPassword: ${currentPasswordPassword}
    ''';
  }
}
