import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Registering the event handler for LoginSubmitted
    on<LoginSubmitted>((event, emit) async {
      final email = event.email;
      final password = event.password;

      // Simple login validation logic
      if (email.isEmpty || password.isEmpty) {
        emit(LoginFailure("Please enter valid credentials"));
      } else {
        emit(LoginSuccess());
      }
    });
  }
}
