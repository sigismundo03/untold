import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/ui/onboarding/widgets/image_picker_dialog_widget%20.dart';

import '../../login/screen/login_screen.dart';
import '../../login/widgets/primary_button_widget.dart';
import '../../login/widgets/primary_text_field_widget.dart';
import '../widgets/choose_image_card_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
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
            Padding(
              padding: const EdgeInsets.all(32),
              child: ChooseImageCardWidget(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ImagePickerDialogWidget(
                      onCameraTap: () {
                        // Abrir câmera
                      },
                      onGalleryTap: () {
                        // Abrir galeria
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return PrimaryTextFieldWidget(
                hintText: 'Your name',
                controller: TextEditingController(),
                onChanged: (_) {},
              );
            }),
            const SizedBox(height: 16),
            Column(
              children: [
                PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Continue',
                ),
                SecondaryButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  value: 'Back',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
