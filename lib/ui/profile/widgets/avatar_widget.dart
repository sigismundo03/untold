import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.assetName,
    required this.text,
    this.onPressed,
    required this.subtext,
    this.isEdit = false,
    this.image,
  });
  final String assetName;
  final Widget text;
  final void Function()? onPressed;

  final Widget subtext;
  final bool isEdit;

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 57,
              backgroundImage: image != null
                  ? FileImage(image!)
                  : AssetImage(
                      assetName,
                    ),
            ),
            if (isEdit)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(87, 79, 62, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          'assets/camera.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              subtext,
            ],
          ),
        ),
      ],
    );
  }
}
