part of 'system_shortcuts_bloc.dart';

@immutable
abstract class SystemShortcutsEvent {}


class SystemShortcutsAddedPathEvent extends SystemShortcutsEvent {


  final Map<String, dynamic> pathFormData;
  SystemShortcutsAddedPathEvent({required this.pathFormData});
}

class SystemShortcutsCancelAddLinkEvent extends SystemShortcutsEvent {

}

class SystemShortcutsAddLinkEvent extends SystemShortcutsEvent {

}
class SystemShortcutsAddInputEvent extends SystemShortcutsEvent {

}
class SystemShortcutsDeleteLinkEvent extends SystemShortcutsEvent {
  final SystemLink link;

  SystemShortcutsDeleteLinkEvent({required this.link});
}