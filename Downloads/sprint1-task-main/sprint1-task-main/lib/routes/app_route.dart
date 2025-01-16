import 'package:task/features/auth/loginscreen.dart';
import 'package:task/features/auth/onboardscreen.dart';

class AppRoute {
  AppRoute._();

  static String onboardScreenRoute = '/';
  static String registerscreenRoute = '/registerscreen';
  static String loginScreenRoute = '/loginscreen';
  static String dashboardScreenRoute = '/dashboardscreen';

  static final routes = {
    onboardScreenRoute: (context) => const OnboardScreen(),
    loginScreenRoute: (context) => Loginscreen(),
    // Add other routes here
  };
}
