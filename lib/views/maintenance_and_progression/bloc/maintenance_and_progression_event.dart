part of 'maintenance_and_progression_bloc.dart';

@immutable
abstract class MaintenanceAndProgressionEvent {}

class MaintenanceAndProgressionAddEvent extends MaintenanceAndProgressionEvent {
  final String value;
  final String type;
  MaintenanceAndProgressionAddEvent({required this.value, required this.type});
}

class MaintenanceAndProgressionRemoveEvent extends MaintenanceAndProgressionEvent {
  final String value;
  final String type;
  MaintenanceAndProgressionRemoveEvent({required this.value, required this.type});
}