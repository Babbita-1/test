import 'package:get_it/get_it.dart';
import 'package:task/bloc/register_bloc.dart';
import 'package:task/cubit/dashboard_cubit.dart';
import 'package:task/cubit/login_cubit.dart';
import 'package:task/cubit/onboardscreen_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DashboardCubit());
  locator.registerLazySingleton(() => OnboardCubit());
  locator.registerLazySingleton(() => LoginCubit());
  locator.registerLazySingleton(() => RegisterCubit());
}
