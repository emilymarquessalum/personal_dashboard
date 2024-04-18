part of 'page_structures_bloc.dart';

@immutable
abstract class PageStructuresEvent {}


class PageStructuresAddEvent extends PageStructuresEvent {
  final PageStructure pageStructure;
  PageStructuresAddEvent({required this.pageStructure});
}

class PageStructuresCloseEvent extends PageStructuresEvent {
  final PageStructure pageStructure;
  PageStructuresCloseEvent({required this.pageStructure});
}

class PageStructuresLoadEvent extends PageStructuresEvent {
  PageStructuresLoadEvent();
}

class PageStructuresMoveUpEvent extends PageStructuresEvent {
  final PageStructure pageStructure;
  PageStructuresMoveUpEvent({required this.pageStructure});
}

class PageStructuresMoveTopEvent extends PageStructuresEvent {
  final PageStructure pageStructure;
  PageStructuresMoveTopEvent({required this.pageStructure});
}

class PageStructuresMoveDownEvent extends PageStructuresEvent {
  final PageStructure pageStructure;
  PageStructuresMoveDownEvent({required this.pageStructure});
}

class PageStructuresClearEvent extends PageStructuresEvent {
  PageStructuresClearEvent();
}