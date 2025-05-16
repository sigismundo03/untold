import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(240, 42),
        backgroundColor: const Color.fromRGBO(188, 76, 241, 0.2),
        side: const BorderSide(
          color: const Color.fromRGBO(241, 204, 76, 0.2),
          width: 0.92,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.33),
        ),
        shadowColor: Color.fromRGBO(170, 115, 240, 1),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(170, 115, 240, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
