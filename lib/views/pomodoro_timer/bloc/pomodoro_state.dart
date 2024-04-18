part of 'pomodoro_cubit.dart';

@immutable
abstract class PomodoroState {}

class PomodoroInitial extends PomodoroState {}


class PomodoroRunning extends PomodoroState {
  final int seconds;
  PomodoroRunning({required this.seconds});
}
class PomodoroStopped extends PomodoroState {
  final int seconds;
  PomodoroStopped({required this.seconds});
}

class PomodoroEnded extends PomodoroState {
  PomodoroEnded();
}
