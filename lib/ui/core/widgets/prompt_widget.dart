import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PromptWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String buttonText;

  const PromptWidget(
      {super.key,
      required this.onTap,
      required this.text,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.45),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: buttonText,
            style: TextStyle(
              color: Color.fromRGBO(170, 115, 240, 1),
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
