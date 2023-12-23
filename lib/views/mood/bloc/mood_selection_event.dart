part of 'mood_selection_bloc.dart';

@immutable
abstract class MoodSelectionEvent {}


class MoodWasSelectedEvent extends MoodSelectionEvent {
  final MoodType moodType;

  MoodWasSelectedEvent({required this.moodType});
}