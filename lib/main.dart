import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/core/di/injection.dart';
import 'ui/core/theme/theme.dart';
import 'ui/login/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  );

setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: const LoginScreen(),
    );
  }
}
