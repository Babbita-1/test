import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/app/constants/hive_table_constant.dart';
import 'package:task/features/auth/registerscreen.dart';

import 'cubit/dashboard_cubit.dart';
import 'features/auth/onboardscreen.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open the user settings box
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox(HiveTableConstant.userSettingsBox);

  // Setup the service locator
  setupLocator(); // Updated function call

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<DashboardCubit>(),
      child: MaterialApp(
        title: 'Hotel Booking App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        debugShowCheckedModeBanner: false,
        home: _getInitialScreen(),
      ),
    );
  }

  Widget _getInitialScreen() {
    final box = Hive.box(HiveTableConstant.userSettingsBox);
    final hasCompletedOnboarding = box.get(
      HiveTableConstant.hasCompletedOnboardingKey,
      defaultValue: false,
    );

    return hasCompletedOnboarding
        ? const RegisterScreen()
        : const OnboardScreen();
  }
}
