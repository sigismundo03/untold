// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  Computed<StatusEnum>? _$statusComputed;

  @override
  StatusEnum get status =>
      (_$statusComputed ??= Computed<StatusEnum>(() => super.status,
              name: '_ProfileViewModelBase.status'))
          .value;
  Computed<StatusEnum>? _$statusButtonComputed;

  @override
  StatusEnum get statusButton =>
      (_$statusButtonComputed ??= Computed<StatusEnum>(() => super.statusButton,
              name: '_ProfileViewModelBase.statusButton'))
          .value;

  late final _$userAtom =
      Atom(name: '_ProfileViewModelBase.user', context: context);

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

  late final _$_statusAtom =
      Atom(name: '_ProfileViewModelBase._status', context: context);

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

  late final _$_statusButtonAtom =
      Atom(name: '_ProfileViewModelBase._statusButton', context: context);

  @override
  StatusEnum get _statusButton {
    _$_statusButtonAtom.reportRead();
    return super._statusButton;
  }

  @override
  set _statusButton(StatusEnum value) {
    _$_statusButtonAtom.reportWrite(value, super._statusButton, () {
      super._statusButton = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_ProfileViewModelBase.deleteUser', context: context);

  @override
  Future<void> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_ProfileViewModelBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
user: ${user},
status: ${status},
statusButton: ${statusButton}
    ''';
  }
}
