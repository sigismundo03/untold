import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPromptWidget extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const SignUpPromptWidget({super.key, required this.onSignUpTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.45),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Sign Up!',
            style: TextStyle(
              color: Color.fromRGBO(170, 115, 240, 1),
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSignUpTap,
          ),
        ],
      ),
    );
  }
}
