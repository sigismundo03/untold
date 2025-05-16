import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        const CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ),
        ),
        const SizedBox(height: 12),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello,",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 14,
              ),
            ),
            const Text(
              "Eva Mendes",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
