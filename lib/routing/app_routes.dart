import 'package:flutter/material.dart';
import 'package:untold/domain/model/movie_model.dart';
import 'package:untold/ui/change_password/screens/change_password_screen.dart';
import 'package:untold/ui/edit_profile/screens/edit_profile_screen.dart';
import 'package:untold/ui/forgot_password/screen/forgot_password_instructions_screen.dart';
import 'package:untold/ui/forgot_password/screen/forgot_password_screen.dart';
import 'package:untold/ui/home/screens/home_screen.dart';
import 'package:untold/ui/login/screen/login_screen.dart';
import 'package:untold/ui/onboarding/screens/onboarding_screen.dart';
import 'package:untold/ui/sign_up/screen/sign_up_screen.dart';
import 'package:untold/ui/video_app/screens/video_app_screen.dart';

import '../domain/model/user_model.dart';
import '../ui/check_auth/check_auth_screen.dart';
import '../ui/profile/screen/profile_screen.dart';
import '../ui/subscription/screens/subscription_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';
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
  static const String subscription = '/subscription';
  static const String videoApp = '/video-app';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => CheckAuthScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as UserModel;
            return OnboardingScreen(
              user: args,
            );
          },
        );
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case editProfile:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as UserModel;
            return EditProfileScreen(
              user: args,
            );
          },
        );

      case subscription:
        return MaterialPageRoute(builder: (_) => SubscriptionScreen());

      case videoApp:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as MovieModel;
          return VideoAppScreen(
            movie: args,
          );
        });

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Rota não encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
