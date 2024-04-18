import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_dashboard/views/week_routine/models/routine_day.dart';
import 'package:personal_dashboard/views/week_routine/models/routine_item.dart';

part 'week_routine_event.dart';
part 'week_routine_state.dart';

class WeekRoutineBloc extends Bloc<WeekRoutineEvent, WeekRoutineState> {


  List<RoutineItem> lastCopiedRoutineList = [];

  List<RoutineDay> routineDays = [

    RoutineDay(routineItems: [], day: 'Segunda'),
    RoutineDay(routineItems: [], day: 'Terça'),
    RoutineDay(routineItems: [], day: 'Quarta'),
    RoutineDay(routineItems: [], day: 'Quinta'),
    RoutineDay(routineItems: [], day: 'Sexta'),
    RoutineDay(routineItems: [], day: 'Sábado'),
    RoutineDay(routineItems: [], day: 'Domingo'),

  ];

  WeekRoutineBloc() : super(WeekRoutineInitial()) {
    on<WeekRoutineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
