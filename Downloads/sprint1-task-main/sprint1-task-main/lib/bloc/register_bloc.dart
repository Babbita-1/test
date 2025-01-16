import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart'; // Include this part for the state

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(String fullName, String email, String password) async {
    emit(RegisterLoading());

    // Simulate a delay for registration
    await Future.delayed(const Duration(seconds: 2));

    // Add your registration logic here
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      emit(RegisterFailure('Please fill in all fields'));
    } else if (password.length < 6) {
      emit(RegisterFailure('Password must be at least 6 characters'));
    } else {
      // Simulate success
      emit(RegisterSuccess());
    }
  }
}
