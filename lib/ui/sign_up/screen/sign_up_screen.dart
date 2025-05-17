import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/routing/app_routes.dart';

import '../../core/widgets/primary_button_widget.dart';
import '../../core/widgets/primary_text_field_widget.dart';
import '../../core/widgets/prompt_widget.dart';
import '../../core/widgets/social_login_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
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
                  ),
                  SocialLoginButtonWidget(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    image: 'assets/apple.svg',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(244, 244, 244, 0.2),
                      endIndent: 1,
                      indent: 1,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Or Sign in With',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(85, 82, 82, 1),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color.fromRGBO(244, 244, 244, 0.2),
                      endIndent: 1,
                      indent: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Email',
                  controller: TextEditingController(),
                  onChanged: (_) {},
                );
              }),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(108, 109, 122, 1),
                      size: 20,
                    ),
                  ),
                  controller: TextEditingController(),
                  onChanged: (_) {},
                );
              }),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Confirm your Password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(108, 109, 122, 1),
                      size: 20,
                    ),
                  ),
                  controller: TextEditingController(),
                  onChanged: (_) {},
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return PrimaryButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.onboarding);
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
