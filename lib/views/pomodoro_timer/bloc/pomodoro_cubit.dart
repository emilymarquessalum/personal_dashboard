import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {

  int maxSeconds = 0;
  int secondsLeft = 0;
  bool running = false;
  bool paused = false;
  PomodoroCubit() : super(PomodoroInitial());


  void start() {
    secondsLeft = maxSeconds;
    running = true;
    paused = false;
    emit(PomodoroRunning(seconds: secondsLeft));
  }

  void stop() {
    running = false;
    emit(PomodoroStopped(seconds: maxSeconds));
  }

  void pause() {

    paused = !paused;

    emit(PomodoroStopped(seconds: secondsLeft));
  }

  toggle() {
    if (running) {
      stop();
    } else {
      start();
    }
  }

  setMaxSeconds(int seconds) {
    maxSeconds = seconds;
  }

  void decrementTimer() {

    if (!running || paused) {
      return;
    }
    secondsLeft--;

    if (secondsLeft <= 0) {
      end();
      return;
    }

    emit(PomodoroRunning(seconds: secondsLeft));
  }

  void end() {
    emit(PomodoroEnded());
  }
}
