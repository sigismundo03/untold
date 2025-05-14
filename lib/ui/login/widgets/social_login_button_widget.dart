
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  const SocialLoginButtonWidget({
    super.key,
    required this.color,
    required this.image,
  });
  final Color? color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: color,
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              width: 30,
              height: 30,
            ),
          ),
        )
      ],
    );
  }
}
