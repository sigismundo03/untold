import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/routing/app_routes.dart';
import 'package:untold/ui/core/widgets/exports.dart';
import 'package:untold/ui/sign_up/view_model/sign_up_view_model.dart';

import '../../core/di/injection.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SingUpViewModel _singUpViewModel = getIt<SingUpViewModel>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    void showAppleLoginError(BuildContext context) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Login com Apple indisponível'),
          content: const Text(
            'Este recurso não foi implementado porque o desenvolvedor não possui um dispositivo Apple (macOS/iOS).',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                'assets/large_logo.svg',
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
              ),
              PromptWidget(
                  buttonText: 'Sign In!',
                  text: 'Already have an account?  ',
                  onTap: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 8),
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 62, right: 62),
                child: Text(
                  'To get started, please complete your account registration.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 0.45),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  SocialLoginButtonWidget(
                    color: Color.fromRGBO(188, 76, 241, 0.2),
                    image: 'assets/google.svg',
                    onPressed: () async {
                      await _singUpViewModel.loginWithGoogle();
                      if (_singUpViewModel.status.isSuccess) {
                        if (mounted) {
                          Navigator.pushNamed(context, AppRoutes.profile);
                        }
                      }
                    },
                  ),
                  SocialLoginButtonWidget(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    image: 'assets/apple.svg',
                    onPressed: () {
                      showAppleLoginError(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DividerNameWidget(
                text: 'Or Sign up With',
              ),
              const SizedBox(height: 8),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Email',
                  controller: emailController,
                  onChanged: (value) {
                    _singUpViewModel.setEmail(value);
                  },
                );
              }),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Password',
                  obscureText: _singUpViewModel.isObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _singUpViewModel.setObscure(!_singUpViewModel.isObscure);
                    },
                    icon: Icon(
                     _singUpViewModel.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      color: Color.fromRGBO(108, 109, 122, 1),
                      size: 20,
                    ),
                  ),
                  controller: passwordController,
                  onChanged: (value) {
                    _singUpViewModel.setPassword(value);
                  },
                );
              }),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Confirm your Password',
                  obscureText: _singUpViewModel.isObscureConfirmPassWord,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _singUpViewModel.setObscureConfirmPassWord(
                          !_singUpViewModel.isObscureConfirmPassWord);
                    },
                    icon: Icon(
_singUpViewModel.isObscureConfirmPassWord
                            ? Icons.visibility_off
                            : Icons.visibility,
                      color: Color.fromRGBO(108, 109, 122, 1),
                      size: 20,
                    ),
                  ),
                  controller: confirmPasswordController,
                  onChanged: (value) {
                    _singUpViewModel.setConfirmPassword(value);
                  },
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return PrimaryButtonWidget(
                  onPressed: () {
                    if (_singUpViewModel.isFormValid &&
                        _singUpViewModel.currentPasswordPassword) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.onboarding,
                        arguments: _singUpViewModel.user,
                      );
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar( );
                    }
                  },
                  text: 'Create Account',
                );
              }),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
