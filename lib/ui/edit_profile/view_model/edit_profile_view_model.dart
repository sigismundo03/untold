import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/profile_repository/profile_repository.dart';

import '../../../domain/model/user_model.dart';
import '../../core/enum/status_enum.dart';

part 'edit_profile_view_model.g.dart';

class EditProfileViewModel = _EditProfileViewModelBase
    with _$EditProfileViewModel;

abstract class _EditProfileViewModelBase with Store {
  UserModel user = UserModel();
  final ProfileRepository _profileRepository;

  @observable
  StatusEnum _status = StatusEnum.init;
  final ImagePicker _picker = ImagePicker();
  @observable
  File? _image;

  _EditProfileViewModelBase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;

  @computed
  StatusEnum get status => _status;
  @computed
  File? get image => _image;

  @computed
  bool get validName => user.name!.trim().isNotEmpty && _image != null;

  @action
  Future<void> updatedProfile() async {
    _status = StatusEnum.loading;
    try {
      await _profileRepository.editProfile(
        user.name!,
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
}
