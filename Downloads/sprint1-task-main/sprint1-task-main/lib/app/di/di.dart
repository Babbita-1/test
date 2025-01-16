import 'package:get_it/get_it.dart';
// Import your classes for onboarding, login, register screens, etc.

import 'package:task/features/auth/loginscreen.dart';
import 'package:task/features/auth/onboardscreen.dart';
import 'package:task/features/auth/registerscreen.dart';

// Create an instance of GetIt
final GetIt locator = GetIt.instance;

// Set up all your services and screen dependencies
void setupLocator() {
  // Registering screens as dependencies
  locator.registerFactory(() => OnboardScreen());
  locator.registerFactory(() => Loginscreen());
  locator.registerFactory(() => RegisterScreen());

  // Add more services or repositories here if you have them
  // locator.registerLazySingleton<SomeService>(() => SomeServiceImplementation());
}
