// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingViewModel on _OnboardingViewModelBase, Store {
  Computed<StatusEnum>? _$statusComputed;

  @override
  StatusEnum get status =>
      (_$statusComputed ??= Computed<StatusEnum>(() => super.status,
              name: '_OnboardingViewModelBase.status'))
          .value;
  Computed<File?>? _$imageComputed;

  @override
  File? get image => (_$imageComputed ??= Computed<File?>(() => super.image,
          name: '_OnboardingViewModelBase.image'))
      .value;

  late final _$_statusAtom =
      Atom(name: '_OnboardingViewModelBase._status', context: context);

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
      Atom(name: '_OnboardingViewModelBase._image', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('_OnboardingViewModelBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_OnboardingViewModelBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$_OnboardingViewModelBaseActionController =
      ActionController(name: '_OnboardingViewModelBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_OnboardingViewModelBaseActionController.startAction(
        name: '_OnboardingViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_OnboardingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullUser(UserModel value) {
    final _$actionInfo = _$_OnboardingViewModelBaseActionController.startAction(
        name: '_OnboardingViewModelBase.setFullUser');
    try {
      return super.setFullUser(value);
    } finally {
      _$_OnboardingViewModelBaseActionController.endAction(_$actionInfo);
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
