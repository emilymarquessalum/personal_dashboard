part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class HomeAddedPathEvent extends HomeEvent {


  final Map<String, dynamic> pathFormData;
  HomeAddedPathEvent({required this.pathFormData});
}

class HomeAddLinkEvent extends HomeEvent {

}
class HomeAddInputEvent extends HomeEvent {

}
class HomeDeleteLinkEvent extends HomeEvent {
  final SystemLink link;

  HomeDeleteLinkEvent({required this.link});
}