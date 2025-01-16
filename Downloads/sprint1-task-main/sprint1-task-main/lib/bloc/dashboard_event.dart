import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends DashboardEvent {
  final int newIndex;

  const TabChanged(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
