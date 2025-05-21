import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/ui/core/widgets/exports.dart';

import '../../../routing/app_routes.dart';
import '../../../utils/dialog_helper.dart';
import '../../core/di/injection.dart';
import '../view_model/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordViewModel _forgotPasswordViewModel =
      getIt<ForgotPasswordViewModel>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                SvgPicture.asset(
                  'assets/small_logo.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
                ),
                const SizedBox(height: 32),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 0.45),
                  ),
                ),
              ],
            ),
            Observer(builder: (_) {
              return PrimaryTextFieldWidget(
                hintText: 'Email',
                controller: emailController,
                onChanged: (value) {
                  _forgotPasswordViewModel.setEmail(value);
                },
              );
            }),
            Observer(builder: (context) {
              return Column(
                children: [
                  _forgotPasswordViewModel.status.isLoading
                      ? const CircularProgressIndicator()
                      : PrimaryButtonWidget(
                          onPressed: () async {
                            if (_forgotPasswordViewModel.user.email != null &&
                                _forgotPasswordViewModel
                                    .user.email!.isNotEmpty) {
                              await _forgotPasswordViewModel
                                  .sendPasswordResetEmail();
                              Navigator.pushReplacementNamed(context,
                                  AppRoutes.forgotPasswordInstructions);
                            } else {
                              DialogHelper.showError(context);
                            }
                          },
                          text: 'Send reset instructions',
                        ),
                  SecondaryButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Back',
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
