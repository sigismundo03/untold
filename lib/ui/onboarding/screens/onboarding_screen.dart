import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untold/domain/model/user_model.dart';
import 'package:untold/routing/app_routes.dart';
import 'package:untold/ui/core/widgets/exports.dart';
import 'package:untold/ui/onboarding/view_model/onboarding_view_model.dart';

import '../../../utils/dialog_helper.dart';
import '../../core/di/injection.dart';
import '../widgets/choose_image_card_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingViewModel _onboardingViewModel = getIt<OnboardingViewModel>();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _onboardingViewModel.setFullUser(widget.user);
  }

  Future<void> _pickImage(ImageSource source) async {
    await _onboardingViewModel.pickImage(source);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                'assets/small_logo.svg',
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    'Tell us more!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Text(
                    'Complete your profile',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.45),
                    ),
                  ),
                ],
              ),
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(32),
                  child: ChooseImageCardWidget(
                    image: _onboardingViewModel.image,
                    onTap: () {
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
                  ),
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Your name',
                  controller: nameController,
                  onChanged: (value) {
                    _onboardingViewModel.setName(value);
                  },
                );
              }),
              const SizedBox(height: 16),
              Column(
                children: [
                  Observer(builder: (context) {
                    return _onboardingViewModel.status.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : PrimaryButtonWidget(
                            onPressed: () async {
                              await _onboardingViewModel.register();
                              if (_onboardingViewModel.status.isSuccess) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.home,
                                    (Route<dynamic> route) => false);
                              } else {
                                DialogHelper.showError(context);
                              }
                            },
                            text: 'Continue',
                          );
                  }),
                  SecondaryButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Back',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
