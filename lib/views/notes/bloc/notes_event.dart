part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}


class NotesAddEvent extends NotesEvent {
  final String input;
  NotesAddEvent(this.input);
}

class NotesDeleteEvent extends NotesEvent {
  final String input;
  NotesDeleteEvent(this.input);
}

