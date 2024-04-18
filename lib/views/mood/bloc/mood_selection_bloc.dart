import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:meta/meta.dart';

part 'mood_selection_event.dart';
part 'mood_selection_state.dart';

class MoodSelectionBloc extends Bloc<MoodSelectionEvent, MoodSelectionState> {

  MoodType? selectedMoodType;

  MoodSelectionBloc() : super(MoodSelectionInitialState()) {
    on<MoodSelectionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MoodWasSelectedEvent>((event, emit) {

      if(selectedMoodType == event.moodType) {
        selectedMoodType = null;
        emit(MoodSelectionInitialState());
        return;
      }
      selectedMoodType = event.moodType;
      emit(MoodIsSelectedState());
    });
  }
}
