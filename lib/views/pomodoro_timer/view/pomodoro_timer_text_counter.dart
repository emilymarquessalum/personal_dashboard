import 'package:common_extensions/extensions/ui/for_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/pomodoro_timer/bloc/pomodoro_cubit.dart';
import 'package:personal_dashboard/views/pomodoro_timer/popups/select_duration_popup.dart';

class PomodoroTimerTextCounter extends StatefulWidget {
  const PomodoroTimerTextCounter({super.key});

  @override
  State<PomodoroTimerTextCounter> createState() =>
      _PomodoroTimerTextCounterState();
}

class _PomodoroTimerTextCounterState extends State<PomodoroTimerTextCounter> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  timer() {
    Future.delayed(Duration(seconds: 1), () {
      context.read<PomodoroCubit>().decrementTimer();
      timer();
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PomodoroCubit, PomodoroState>(
      builder: (context, state) {


        PomodoroCubit cubit = context.read<PomodoroCubit>();
        
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (cubit.running) {
                    return;
                  }

                  SelectDurationPopup(
                    initialSeconds: cubit.maxSeconds == 0 ? null : cubit
                        .maxSeconds,
                  ).showDialogWithWidget(context).then((value) {
                    if (value == null) {
                      return;
                    }

                    setState(() {
                      cubit.maxSeconds = value.inSeconds;
                      cubit.secondsLeft = cubit.maxSeconds;
                    });
                  });
                },
                child: Text(
                    (cubit.running == false && cubit.paused == false) ?
                    secondsTimerText(cubit.maxSeconds) :
                    secondsTimerText(cubit.secondsLeft)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cubit.running == false ?
                    Container() :
                    ElevatedButton(
                      onPressed: () {
                        cubit.pause();
                      },
                      child: Text("Pause"),
                    ),
                    cubit.running == false ?
                    Container() :
                    SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cubit.toggle();
                        });
                      },
                      child: Text(cubit.running ? "Stop" : "Start"),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String secondsTimerText(int seconds) {
    if (seconds > 3600) {
      return "${
          (seconds ~/ 3600).toString().padLeft(2, "0")
      }:${
          ((seconds % 3600) ~/ 60).toString().padLeft(2, "0")
      }:${
          (seconds % 60).toString().padLeft(2, "0")
      }";
    }
    return "${
        (seconds ~/ 60).toString().padLeft(2, "0")
    }:${
        (seconds % 60).toString().padLeft(2, "0")
    }";
  }


}
