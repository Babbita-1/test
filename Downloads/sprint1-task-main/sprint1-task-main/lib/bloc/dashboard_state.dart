import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  final int currentIndex;

  const DashboardState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial() : super(0);
}

class DashboardTabUpdated extends DashboardState {
  const DashboardTabUpdated(super.currentIndex);
}
