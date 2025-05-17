import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/routing/app_routes.dart';
import 'package:untold/ui/core/di/injection.dart';
import 'package:untold/ui/core/widgets/prompt_widget.dart';
import 'package:untold/ui/login/view_model/login_view_model.dart';

import '../../core/widgets/secondary_button_widget.dart';
import '../../core/widgets/primary_button_widget.dart';
import '../../core/widgets/primary_text_field_widget.dart';
import '../../core/widgets/social_login_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = getIt<LoginViewModel>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                'assets/small_logo.svg',
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              Text(
                'Look who is here!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 0.45),
                ),
              ),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Email',
                  controller: emailController,
                  onChanged: _loginViewModel.setEmail,
                );
              }),
              Observer(builder: (_) {
                return PrimaryTextFieldWidget(
                  hintText: 'Password',
                  obscureText: _loginViewModel.isObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _loginViewModel.setObscure(!_loginViewModel.isObscure);
                    },
                    icon: Icon(
                      _loginViewModel.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color.fromRGBO(108, 109, 122, 1),
                      size: 20,
                    ),
                  ),
                  controller: passwordController,
                  onChanged: _loginViewModel.setPassword,
                );
              }),
              SecondaryButtonWidget(
                text: 'Forgot password?',
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },
              ),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return _loginViewModel.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PrimaryButtonWidget(
                        onPressed: () {
                          // if (_loginViewModel.isFormValid) {
                          //   _loginViewModel.login();
                          // }

                          Navigator.pushNamed(context, AppRoutes.profile);
                        },
                        text: 'Login',
                      );
              }),
              const SizedBox(height: 16),
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
              const SizedBox(height: 4),
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
              PromptWidget(
                  buttonText: 'Sign Up!',
                  text: "Don't have an account? ",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
