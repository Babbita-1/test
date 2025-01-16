// Ensure you are importing the correct file

import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/registerscreen.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(String fullName, String email, String password) {
    try {
      // Logic for registration goes here
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
