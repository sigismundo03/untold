import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untold/ui/core/widgets/exports.dart';

import '../../../domain/model/user_model.dart';
import '../../../utils/dialog_helper.dart';
import '../../core/di/injection.dart';
import '../view_model/edit_profile_view_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileViewModel _viewModel = getIt.get<EditProfileViewModel>();
  TextEditingController _nameCotroller = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    await _viewModel.pickImage(source);

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _nameCotroller.text = widget.user.name ?? 'Eva mendes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(170, 115, 240, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                        Observer(builder: (context) {
                          return AvatarWidget(
                            assetName: widget.user.photoUrl ?? '',
                            text: Text(
                              'Choose Image,',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            image: _viewModel.image,
                            isEdit: true,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => ImagePickerDialogWidget(
                                  onCameraTap: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                  onGalleryTap: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                ),
                              );
                            },
                            subtext: Text(
                                'A square .jpg, .gif,\n or .png image\n 200x200 or larger',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                )),
                          );
                        }),
                        const SizedBox(height: 16),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: widget.user.name ?? 'Eva mendes',
                            obscureText: false,
                            controller: _nameCotroller,
                            onChanged: (value) {
                              _viewModel.setName(value);
                            },
                          );
                        }),
                        const SizedBox(height: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return Center(
                        child: _viewModel.status.isLoading
                            ? CircularProgressIndicator()
                            : PrimaryButtonWidget(
                                onPressed: () async {
                                  if (_viewModel.validName) {
                                    await _viewModel.updatedProfile();
                                    if (_viewModel.status.isSuccess) {
                                      Navigator.pop(context);
                                    } else {
                                      DialogHelper.showError(context);
                                    }
                                  } else {
                                   DialogHelper.showError(context);
                                  }
                                },
                                text: 'Update profile',
                              ),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
