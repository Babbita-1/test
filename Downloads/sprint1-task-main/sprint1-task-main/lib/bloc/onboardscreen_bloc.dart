import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/onboardscreen_event.dart';
import 'package:task/bloc/onboardscreen_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState(currentPage: 0, isLastPage: false)) {
    on<OnPageChanged>((event, emit) {
      emit(state.copyWith(
        currentPage: event.pageIndex,
        isLastPage: event.pageIndex == 2, // Update based on the last page index
      ));
    });

    on<OnNextPressed>((event, emit) {
      if (!state.isLastPage) {
        emit(state.copyWith(
          currentPage: state.currentPage + 1,
          isLastPage: state.currentPage + 1 == 2,
        ));
      }
    });
  }
}
