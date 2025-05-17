import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../routing/app_routes.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../../core/widgets/primary_button_widget.dart';
import '../../core/widgets/primary_text_field_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                const SizedBox(height: 32),
                SvgPicture.asset(
                  'assets/small_logo.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
                ),
                const SizedBox(height: 32),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 0.45),
                  ),
                ),
              ],
            ),
            Observer(builder: (_) {
              return PrimaryTextFieldWidget(
                hintText: 'Email',
                controller: TextEditingController(),
                onChanged: (_) {},
              );
            }),
            Column(
              children: [
                PrimaryButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.forgotPasswordInstructions);
                  },
                  text: 'Send reset instructions',
                ),
                SecondaryButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Back',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
