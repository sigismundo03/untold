import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../login/widgets/primary_button_widget.dart';
import '../../login/widgets/primary_text_field_widget.dart';
import '../../onboarding/widgets/image_picker_dialog_widget.dart';
import '../../profile/widgets/avatar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _image = File(image.path);
      setState(() {});

      /// remove e coloc mobx
    }
    Navigator.pop(context);
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
                        AvatarWidget(
                          assetName: 'assets/avatar.png',
                          text: Text(
                            'Choose Image,',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          image: _image,
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
                        ),
                        const SizedBox(height: 16),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: 'Eva mendes',
                            obscureText: false,
                            controller: TextEditingController(),
                            onChanged: (_) {},
                          );
                        }),
                        const SizedBox(height: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return Center(
                        child: PrimaryButtonWidget(
                          onPressed: () {
                            Navigator.pop(context);
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
