import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/ui/login/widgets/sign_up_prompt_widget.dart';

import '../widgets/primary_button_widget.dart';
import '../widgets/primary_text_field_widget.dart';
import '../widgets/social_login_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            PrimaryTextFieldWidget(
              hintText: 'Email',
              controller: TextEditingController(),
              onChanged: (value) {},
            ),
            PrimaryTextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              suffixIcon: Icon(
                Icons.visibility_off,
                color: Color.fromRGBO(108, 109, 122, 1),
                size: 20,
              ),
              controller: TextEditingController(),
              onChanged: (value) {},
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(170, 115, 240, 1),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              onPressed: () {},
              text: 'Login',
            ),
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
    );
  }
}
