part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}


class NotesLoadEvent extends NotesEvent {

  NotesLoadEvent();
}

class NotesAddEvent extends NotesEvent {
  final String input;
  NotesAddEvent(this.input);
}

class NotesDeleteEvent extends NotesEvent {
  final Note note;
  NotesDeleteEvent(this.note);
}

class UpdateNoteEvent extends NotesEvent {
  final Note note;
  UpdateNoteEvent({required this.note});
}