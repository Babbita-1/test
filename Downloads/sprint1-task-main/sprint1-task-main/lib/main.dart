import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/dashboard_cubit.dart';
import 'package:task/features/auth/onboardscreen.dart';

import 'services/service_locator.dart';

void main() {
  setupLocator(); // Initialize GetIt
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
        home: const OnboardScreen(),
      ),
    );
  }
}
