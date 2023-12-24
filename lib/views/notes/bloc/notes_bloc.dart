


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:request_states/requests/state_response.dart';
import 'package:stream_transform/stream_transform.dart';

import '../data/notes_datasource.dart';
import '../models/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';


class NotesBloc extends Bloc<NotesEvent, NotesState> {


  List<Note> notes = [];
  
  
  NotesDataSource source = NotesDataSourceImpl();
  
  NotesBloc() : super(NotesInitial()) {

    on<NotesLoadEvent>((event, emit) async {

      StateResponse response = await source.getNotes();
      
      
      notes = response.data["data"].map<Note>(
              (e) => Note.fromJson(e)).toList().cast<Note>();

      emit(NotesInitial());
    });
    
    on<NotesAddEvent>((event, emit) {
      notes.add(Note(noteName: event.input,
          noteContent: "", 
        lastChangeDate: DateTime.now().toUtc()
      ));
      emit(NotesInitial());
    });
    
    on<NotesDeleteEvent>((event, emit) {
      notes.remove(
        event.note
      );
      emit(NotesInitial());

      source.saveNotes(notes);
    });
    
    
    on<UpdateNoteEvent>((event, emit) {
      
      emit(NotesInitial());
      

      debugPrint("updating note");
      source.saveNotes(notes);
      
    },

    transformer: (eventsStream,

        //
        mapper) =>
        eventsStream.debounce(const Duration(milliseconds: 500))
        .switchMap(mapper),
    );
    
    
    
  }
}
