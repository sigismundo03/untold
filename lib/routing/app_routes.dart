import 'package:flutter/material.dart';
import 'package:untold/ui/change_password/screens/change_password_scren.dart';
import 'package:untold/ui/edit_profile/screens/edit_profile_screen.dart';
import 'package:untold/ui/forgot_password/screen/forgot_password_instructions_screen.dart';
import 'package:untold/ui/forgot_password/screen/forgot_password_screen.dart';
import 'package:untold/ui/login/screen/login_screen.dart';
import 'package:untold/ui/onboarding/screens/onboarding_screen.dart';
import 'package:untold/ui/sign_up/screen/sign_up_screen.dart';

import '../ui/profile/screen/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String details = '/details';
  static const String forgotPassword = '/forgot-password';
  static const String forgotPasswordInstructions =
      '/forgot-password-instructions';
  static const String login = '/login';
  static const String register = '/register';
  static const String changePassword = '/change-password';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case details:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case changePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());

      case forgotPasswordInstructions:
        return MaterialPageRoute(
            builder: (_) => ForgotPasswordInstructionsScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Rota não encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
