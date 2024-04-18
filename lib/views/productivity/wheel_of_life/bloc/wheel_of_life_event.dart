part of 'wheel_of_life_bloc.dart';

@immutable
abstract class WheelOfLifeEvent {}

class WheelOfLifeLoadEvent extends WheelOfLifeEvent {
  WheelOfLifeLoadEvent();
}

class WheelOfLifeObjectiveUpdatedEvent extends WheelOfLifeEvent {
  final WheelObjective objective;
  final double value;
  WheelOfLifeObjectiveUpdatedEvent({
    required this.objective, required  this.value,
  });
}

class WheelOfLifeFocusedItemChangedEvent extends WheelOfLifeEvent {

  final WheelObjective objective;
  WheelOfLifeFocusedItemChangedEvent({
  required  this.objective});
}

class WheelOfLifeHappinessChangedValue extends WheelOfLifeEvent {
  final double value;
  WheelOfLifeHappinessChangedValue({required this.value});
}


class WheelOfLifeFocusedObjectiveChangedEvent extends WheelOfLifeEvent {
  final WheelObjective objective;
  final WheelObjectiveCategory category;
  WheelOfLifeFocusedObjectiveChangedEvent({
    required this.objective, required this.category,
  });
}

class SaveWheelOfLifeRecord extends WheelOfLifeEvent {
  SaveWheelOfLifeRecord();
}