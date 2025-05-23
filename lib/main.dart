import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'routing/app_routes.dart';
import 'ui/core/di/injection.dart';
import 'ui/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechTravel',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
