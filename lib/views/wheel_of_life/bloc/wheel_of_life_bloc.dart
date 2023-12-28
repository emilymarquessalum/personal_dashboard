import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective_category.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective_record.dart';

part 'wheel_of_life_event.dart';
part 'wheel_of_life_state.dart';

class WheelOfLifeBloc extends Bloc<WheelOfLifeEvent, WheelOfLifeState> {


  WheelObjectiveRecord record = WheelObjectiveRecord(values: {},
      documented: false);

  List<WheelObjectiveCategory> objectiveCategories = [

    WheelObjectiveCategory(
        name: "Career",
        objectives: [
          WheelObjective(name: "Mission"),
          WheelObjective(name: "Growth"),
          WheelObjective(name: "Money"),
        ]
    ),

    WheelObjectiveCategory(name: "Health",
        objectives: [
          WheelObjective(name: "Body"),
          WheelObjective(name: "Mind"),
          WheelObjective(name: "Morals"),
        ]),

    WheelObjectiveCategory(name: "Relations",
        objectives: [
          WheelObjective(name: "Friends"),
          WheelObjective(name: "Family"),
          WheelObjective(name: "Romance"),
        ]),

  ];

  WheelOfLifeBloc() : super(WheelOfLifeInitial()) {
    on<WheelOfLifeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<WheelOfLifeObjectiveUpdatedEvent>((event, emit) {
      record.values[event.objective.id] = event.value;
      emit(WheelOfLifeUpdatedState(record: record));
    });


    for(var category in objectiveCategories) {
      for(var objective in category.objectives) {
        record.values[objective.id] = 1;
      }
    }

  }
}
