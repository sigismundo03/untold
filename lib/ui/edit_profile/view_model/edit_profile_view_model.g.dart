// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileViewModel on _EditProfileViewModelBase, Store {
  Computed<StatusEnum>? _$statusComputed;

  @override
  StatusEnum get status =>
      (_$statusComputed ??= Computed<StatusEnum>(() => super.status,
              name: '_EditProfileViewModelBase.status'))
          .value;
  Computed<File?>? _$imageComputed;

  @override
  File? get image => (_$imageComputed ??= Computed<File?>(() => super.image,
          name: '_EditProfileViewModelBase.image'))
      .value;

  late final _$_statusAtom =
      Atom(name: '_EditProfileViewModelBase._status', context: context);

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

  late final _$_imageAtom =
      Atom(name: '_EditProfileViewModelBase._image', context: context);

  @override
  File? get _image {
    _$_imageAtom.reportRead();
    return super._image;
  }

  @override
  set _image(File? value) {
    _$_imageAtom.reportWrite(value, super._image, () {
      super._image = value;
    });
  }

  late final _$updatedProfileAsyncAction =
      AsyncAction('_EditProfileViewModelBase.updatedProfile', context: context);

  @override
  Future<void> updatedProfile() {
    return _$updatedProfileAsyncAction.run(() => super.updatedProfile());
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_EditProfileViewModelBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$_EditProfileViewModelBaseActionController =
      ActionController(name: '_EditProfileViewModelBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditProfileViewModelBaseActionController
        .startAction(name: '_EditProfileViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
image: ${image}
    ''';
  }
}
