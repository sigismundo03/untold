import 'package:flutter/material.dart';
import 'package:untold/ui/core/widgets/exports.dart';

class DialogHelper {
  static void showAppleLoginError(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialogWidget(
        title: 'Login with Apple unavailable',
        subtitle:
            'This feature has not been implemented because the developer does not have an Apple device (macOS/iOS).',
      ),
    );
  }

  static void showErrorLogin(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialogWidget(
              title: 'Error when logging in',
              subtitle: 'Please check your credentials and try again.',
            ));
  }

  static void showError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialogWidget(
              title: 'Error',
              subtitle: 'Please check the fields and try again.',
            ));
  }
}
