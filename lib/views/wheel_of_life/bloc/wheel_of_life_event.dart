part of 'wheel_of_life_bloc.dart';

@immutable
abstract class WheelOfLifeEvent {}

class WheelOfLifeObjectiveUpdatedEvent extends WheelOfLifeEvent {
  final WheelObjective objective;
  final double value;
  WheelOfLifeObjectiveUpdatedEvent({
    required this.objective, required  this.value,
  });
}