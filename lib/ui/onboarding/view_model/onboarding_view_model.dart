import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../domain/models/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'onboarding_view_model.g.dart';

class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

abstract class _OnboardingViewModelBase with Store {
  UserModel user = UserModel();
  final AuthRepository _authRepository;
  @observable
  StatusEnum _status = StatusEnum.init;
  final ImagePicker _picker = ImagePicker();
  @observable
  File? _image;
  _OnboardingViewModelBase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @computed
  StatusEnum get status => _status;
  @computed
  File? get image => _image;

  @action
  Future<void> register() async {
    _status = StatusEnum.loading;
    try {
      await _authRepository.registerWithEmail(
        email: user.email ?? '',
        password: user.password ?? '',
        username: user.name ?? '',
      );
      _status = StatusEnum.success;
    } catch (e) {
      _status = StatusEnum.error;
    }
  }

  @action
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _image = File(image.path);
    }
  }

  @action
  void setName(String value) {
    user = user.copyWith(name: value);
  }

  @action
  void setFullUser(UserModel value) {
    user = user.copyWith(
      name: value.name,
      email: value.email,
      password: value.password,
    );
  }
}
