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