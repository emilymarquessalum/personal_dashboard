part of 'todopoints_bloc.dart';

@immutable
abstract class TodopointsEvent {}

class TODOPointsAddEvent extends TodopointsEvent {
  final TODOPoint point;

  TODOPointsAddEvent(this.point);
}

class TODOPointsRemoveEvent extends TodopointsEvent {
  final TODOPoint point;

  TODOPointsRemoveEvent(this.point);
}
 
class TODOPointsMoveUpEvent extends TodopointsEvent {
  final TODOPoint point;

  TODOPointsMoveUpEvent(this.point);
}

class TODOPointsMoveDownEvent extends TodopointsEvent {
  final TODOPoint point;

  TODOPointsMoveDownEvent(this.point);
}

class TODOPointsClearDonesEvent extends TodopointsEvent {}

class TODOPointsToggleDoneEvent extends TodopointsEvent {
  final TODOPoint point;

  TODOPointsToggleDoneEvent(this.point);
}