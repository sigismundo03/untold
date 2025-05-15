import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/routing/app_routes.dart';
import 'package:untold/ui/core/di/injection.dart';
import 'package:untold/ui/login/view_model/login_view_model.dart';
import 'package:untold/ui/login/widgets/sign_up_prompt_widget.dart';

import '../widgets/primary_button_widget.dart';
import '../widgets/primary_text_field_widget.dart';
import '../widgets/social_login_button_widget.dart';

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
                'assets/Subtract.svg',
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
                value: 'Forgot password?',
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
                    : PrimaryButton(
                        onPressed: () {
                          if (_loginViewModel.isFormValid) {
                            _loginViewModel.login();
                          }
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
              SignUpPromptWidget(onSignUpTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({
    super.key,
    required this.value,
    required this.onPressed,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,

  });
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final void Function()? onPressed;
  


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(170, 115, 240, 1),
              )),
        ),
      ],
    );
  }
}
