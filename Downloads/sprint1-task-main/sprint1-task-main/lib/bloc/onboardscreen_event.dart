import 'package:equatable/equatable.dart';

abstract class OnboardEvent extends Equatable {
  const OnboardEvent();

  @override
  List<Object> get props => [];
}

class OnPageChanged extends OnboardEvent {
  final int pageIndex;

  const OnPageChanged(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}

class OnNextPressed extends OnboardEvent {}

class OnGetStartedPressed extends OnboardEvent {}
