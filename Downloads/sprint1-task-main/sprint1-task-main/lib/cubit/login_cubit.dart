import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc.dart';

// Ensure that LoginState is correctly defined

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginError("Please enter valid credentials"));
    } else {
      emit(LoginSuccess());
    }
  }
}
