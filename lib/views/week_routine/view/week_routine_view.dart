import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/week_routine/bloc/week_routine_bloc.dart';
import 'package:personal_dashboard/views/week_routine/models/routine_day.dart';

import 'routine_day_container.dart';

class WeekRoutineView extends StatelessWidget {
  const WeekRoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeekRoutineBloc(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: WeekRoutineDaysListScroll(),
      ),
    );
  }
}

class WeekRoutineDaysListScroll extends StatelessWidget {
  const WeekRoutineDaysListScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (RoutineDay routineDay
            in context.read<WeekRoutineBloc>().routineDays)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RoutineDayContainer(routineDay: routineDay),
            ),
          )
      ],
    );
  }
}
