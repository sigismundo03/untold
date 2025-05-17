import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/routing/app_routes.dart';

import '../../core/widgets/primary_button_widget.dart';

class ForgotPasswordInstructionsScreen extends StatelessWidget {
  const ForgotPasswordInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 64),
                SvgPicture.asset(
                  'assets/small_logo.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
                ),
                const SizedBox(height: 64),
                Text(
                  'The instructions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Text(
                  'were sent!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 64),
                Text(
                  'If this was a valid email, instructions to reset your password will be sent to you. Please check your email.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 0.45),
                  ),
                ),
              ],
            ),
            PrimaryButtonWidget(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
              },
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
