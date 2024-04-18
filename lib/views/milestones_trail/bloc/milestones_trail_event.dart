part of 'milestones_trail_bloc.dart';

@immutable
abstract class MilestonesTrailEvent {}


class MilestonesTrailAddMilestoneEvent extends MilestonesTrailEvent {
  final String name;
  MilestonesTrailAddMilestoneEvent({required this.name});
}

class MilestonesTrailCompleteMilestoneEvent extends MilestonesTrailEvent {
  final  Milestone milestone;
  MilestonesTrailCompleteMilestoneEvent({required this.milestone});
}
class MilestonesTrailRemoveMilestoneEvent extends MilestonesTrailEvent {
  final  Milestone milestone;
  MilestonesTrailRemoveMilestoneEvent({required this.milestone});
}


class MilestonesTrailChangeCategoryEvent extends MilestonesTrailEvent {
  final  MilestoneCategory milestoneCategory;
  MilestonesTrailChangeCategoryEvent({required this.milestoneCategory});
}