import 'package:equatable/equatable.dart';

class OnboardState extends Equatable {
  final int currentPage;
  final bool isLastPage;

  const OnboardState({required this.currentPage, required this.isLastPage});

  OnboardState copyWith({int? currentPage, bool? isLastPage}) {
    return OnboardState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object> get props => [currentPage, isLastPage];
}
