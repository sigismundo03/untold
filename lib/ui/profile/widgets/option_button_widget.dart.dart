import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionButtonWidget extends StatelessWidget {
  const OptionButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(51, 51, 63, 0.9),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
