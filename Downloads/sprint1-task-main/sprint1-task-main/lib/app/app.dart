import 'package:flutter/material.dart';
import 'package:task/core/theme/theme_data.dart';
import 'package:task/features/auth/loginscreen.dart';
import 'package:task/features/auth/onboardscreen.dart';
import 'package:task/features/auth/registerscreen.dart';

import '../features/home/dashboardscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/login",
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        routes: {
          "/Onboarding": (context) => const OnboardScreen(),
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
          "/dashboard": (context) => const DashboardScreen(),
        });
  }
}
