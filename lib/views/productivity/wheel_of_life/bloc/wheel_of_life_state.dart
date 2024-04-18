part of 'wheel_of_life_bloc.dart';

@immutable
abstract class WheelOfLifeState {}

class WheelOfLifeInitial extends WheelOfLifeState {}

class WheelOfLifeLoadedState extends WheelOfLifeState {
  final WheelObjectiveRecord record;
  WheelOfLifeLoadedState({
    required this.record,
  });
}

class WheelOfLifeUpdatedState extends WheelOfLifeState {
  final WheelObjectiveRecord record;
  WheelOfLifeUpdatedState({
    required this.record,
  });
}