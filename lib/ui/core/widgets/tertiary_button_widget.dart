import 'package:flutter/material.dart';

class TertiaryButtonWidget extends StatelessWidget {
  const TertiaryButtonWidget({
    super.key,
    required this.borderSideColor,
    this.textColor,
    required this.text,
    required this.onPressed,
  });
  final Color borderSideColor;
  final Color? textColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderSideColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
