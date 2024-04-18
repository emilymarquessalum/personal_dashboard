
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:personal_dashboard/data/local_storage.dart';

import '../models/wheel_objective.dart';
import '../models/wheel_objective_category.dart';
import '../models/wheel_objective_record.dart';


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

  WheelObjective? focusedObjective;
  double happinessValue = 6;

  Map<WheelObjectiveCategory, WheelObjective> focusedObjectives = {};

  WheelOfLifeBloc() : super(WheelOfLifeInitial()) {
    on<WheelOfLifeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<WheelOfLifeObjectiveUpdatedEvent>((event, emit) {
      record.values[event.objective.id] = event.value;
      emit(WheelOfLifeUpdatedState(record: record));
    });

    on<WheelOfLifeHappinessChangedValue>((event, emit) {
      happinessValue = event.value;
      emit(WheelOfLifeUpdatedState(record: record));
    });

    on<WheelOfLifeFocusedObjectiveChangedEvent>((event, emit) {
      focusedObjectives[event.category] = event.objective;
      emit(WheelOfLifeUpdatedState(record: record));
    });

    on<WheelOfLifeFocusedItemChangedEvent>((event, emit) {
      focusedObjective = event.objective;
      emit(WheelOfLifeUpdatedState(record: record));
    });

    on<SaveWheelOfLifeRecord>((event, emit) {

      GetIt.I.get<LocalStorage>().saveData(
      "wheel"
      , {
        "record": record.toJson(),
        "happiness": happinessValue,
      });
      debugPrint("saved ${record.toJson()}");
      emit(WheelOfLifeUpdatedState(record: record));
    });

    on<WheelOfLifeLoadEvent>((event,
        emit) async {
      var data = await GetIt.I.get<LocalStorage>().loadData("wheel");

      debugPrint("loaded $data");
      if(data != null) {

        record = WheelObjectiveRecord.fromJson(data["record"]);
        happinessValue = data["happiness"] ?? happinessValue;
      }
      emit(WheelOfLifeLoadedState(record: record));
    });


    for(var category in objectiveCategories) {
      for(var objective in category.objectives) {
        record.values[objective.id] = 1;
      }
    }

  }
}
