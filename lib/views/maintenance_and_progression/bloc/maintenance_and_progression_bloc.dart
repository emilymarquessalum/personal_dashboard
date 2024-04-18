import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'maintenance_and_progression_event.dart';
part 'maintenance_and_progression_state.dart';

class MaintenanceAndProgressionBloc extends Bloc<MaintenanceAndProgressionEvent, MaintenanceAndProgressionState> {

  List<String> maintenances = [];
  List<String> progressions = [];

  MaintenanceAndProgressionBloc() : super(MaintenanceAndProgressionInitial()) {
    on<MaintenanceAndProgressionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MaintenanceAndProgressionAddEvent>((event, emit) {
      if (event.type == 'Manutenção') {
        maintenances.add(event.value);
      } else {
        progressions.add(event.value);
      }
      emit(MaintenanceAndProgressionInitial());
    });

    on<MaintenanceAndProgressionRemoveEvent>((event, emit) {
      if (event.type == 'Manutenção') {
        maintenances.remove(event.value);
      } else {
        progressions.remove(event.value);
      }
      emit(MaintenanceAndProgressionInitial());
    });
  }
}
