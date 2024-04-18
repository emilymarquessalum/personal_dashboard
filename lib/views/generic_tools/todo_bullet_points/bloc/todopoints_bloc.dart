import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/todo_point.dart';

part 'todopoints_event.dart';
part 'todopoints_state.dart';

class TODOPointsBloc extends Bloc<TodopointsEvent, TodopointsState> {

  List<TODOPoint> points = [
  ];

  TODOPointsBloc() : super(TodopointsInitial()) {
    on<TodopointsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<TODOPointsAddEvent>((event, emit) {
      points.add(event.point);
      emit(TodopointsInitial());
    });

    on<TODOPointsRemoveEvent>((event, emit) {
      points.remove(event.point);
      emit(TodopointsInitial());
    });

    on<TODOPointsMoveUpEvent>((event, emit) {
      int index = points.indexOf(event.point);
      if (index == 0) return;
      points.remove(event.point);
      points.insert(index - 1, event.point);
      emit(TodopointsInitial());
    });

    on<TODOPointsMoveDownEvent>((event, emit) {
      int index = points.indexOf(event.point);
      if (index == points.length - 1) return;
      points.remove(event.point);
      points.insert(index + 1, event.point);
      emit(TodopointsInitial());
    });

    on<TODOPointsClearDonesEvent>((event, emit) {
      points.removeWhere((element) => element.completed);
      emit(TodopointsInitial());
    });

    on<TODOPointsToggleDoneEvent>((event, emit) {
      event.point.completed = !event.point.completed;
      emit(TodopointsInitial());
    });



  }

}






