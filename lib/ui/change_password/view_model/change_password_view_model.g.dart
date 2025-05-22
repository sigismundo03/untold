// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordViewModel on _ChangePasswordViewModelBase, Store {
  Computed<StatusEnum>? _$statusComputed;

  @override
  StatusEnum get status =>
      (_$statusComputed ??= Computed<StatusEnum>(() => super.status,
              name: '_ChangePasswordViewModelBase.status'))
          .value;
  Computed<bool>? _$validPasswordComputed;

  @override
  bool get validPassword =>
      (_$validPasswordComputed ??= Computed<bool>(() => super.validPassword,
              name: '_ChangePasswordViewModelBase.validPassword'))
          .value;

  late final _$userAtom =
      Atom(name: '_ChangePasswordViewModelBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isObscureAtom =
      Atom(name: '_ChangePasswordViewModelBase.isObscure', context: context);

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
      name: '_ChangePasswordViewModelBase.isObscureConfirmPassWord',
      context: context);

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

  late final _$isObscureConfirmNewPassWordAtom = Atom(
      name: '_ChangePasswordViewModelBase.isObscureConfirmNewPassWord',
      context: context);

  @override
  bool get isObscureConfirmNewPassWord {
    _$isObscureConfirmNewPassWordAtom.reportRead();
    return super.isObscureConfirmNewPassWord;
  }

  @override
  set isObscureConfirmNewPassWord(bool value) {
    _$isObscureConfirmNewPassWordAtom
        .reportWrite(value, super.isObscureConfirmNewPassWord, () {
      super.isObscureConfirmNewPassWord = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: '_ChangePasswordViewModelBase._status', context: context);

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

  late final _$changePasswordAsyncAction = AsyncAction(
      '_ChangePasswordViewModelBase.changePassword',
      context: context);

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$_ChangePasswordViewModelBaseActionController =
      ActionController(name: '_ChangePasswordViewModelBase', context: context);

  @override
  void setStatus(StatusEnum value) {
    final _$actionInfo = _$_ChangePasswordViewModelBaseActionController
        .startAction(name: '_ChangePasswordViewModelBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure(bool value) {
    final _$actionInfo = _$_ChangePasswordViewModelBaseActionController
        .startAction(name: '_ChangePasswordViewModelBase.setObscure');
    try {
      return super.setObscure(value);
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureConfirmPassWord(bool value) {
    final _$actionInfo =
        _$_ChangePasswordViewModelBaseActionController.startAction(
            name: '_ChangePasswordViewModelBase.setObscureConfirmPassWord');
    try {
      return super.setObscureConfirmPassWord(value);
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureConfirmNewPassWord(bool value) {
    final _$actionInfo =
        _$_ChangePasswordViewModelBaseActionController.startAction(
            name: '_ChangePasswordViewModelBase.setObscureConfirmNewPassWord');
    try {
      return super.setObscureConfirmNewPassWord(value);
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_ChangePasswordViewModelBaseActionController
        .startAction(name: '_ChangePasswordViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isObscure: ${isObscure},
isObscureConfirmPassWord: ${isObscureConfirmPassWord},
isObscureConfirmNewPassWord: ${isObscureConfirmNewPassWord},
status: ${status},
validPassword: ${validPassword}
    ''';
  }
}
