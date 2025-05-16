import 'dart:io';

import 'package:flutter/material.dart';

class ChooseImageCardWidget extends StatelessWidget {
  const ChooseImageCardWidget({
    super.key,
    this.onTap,
    required this.image,
  });

  final VoidCallback? onTap;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: image != null
                  ? DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: const Color.fromRGBO(188, 76, 241, 0.2),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: image == null
                  ? Icon(
                      Icons.camera_alt_outlined,
                      color: Color.fromRGBO(170, 115, 240, 1),
                      size: 24,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CHOOSE IMAGE",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "A square .jpg, .gif,\nor .png image\n200x200 or larger",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
                height: 1.4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
