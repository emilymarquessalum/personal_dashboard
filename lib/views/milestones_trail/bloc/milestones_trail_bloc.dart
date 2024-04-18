import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/milestone.dart';
import '../models/milestone_category.dart';

part 'milestones_trail_event.dart';
part 'milestones_trail_state.dart';

class MilestonesTrailBloc extends Bloc<MilestonesTrailEvent, MilestonesTrailState> {



  List<MilestoneCategory> milestoneCategories = [
    MilestoneCategory(categoryName: "G1", milestones: [

      Milestone(name: "T", yPosition: 0),
      Milestone(name: "O", yPosition: 10),
      Milestone(name: "D", yPosition: 20),
      Milestone(name: "E", yPosition: -20),
    ]),

    MilestoneCategory(categoryName: "G2", milestones: []),

    MilestoneCategory(categoryName: "G3", milestones: []),

    MilestoneCategory(categoryName: "G4", milestones: []),



  ];

  MilestoneCategory? currentMilestoneCategory;


  List<Milestone> get milestones => currentMilestoneCategory!.milestones;

  MilestonesTrailBloc(
      ) : super(MilestonesTrailInitial()) {


    currentMilestoneCategory = milestoneCategories[0];
    on<MilestonesTrailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MilestonesTrailChangeCategoryEvent>((event, emit){

        currentMilestoneCategory = event.milestoneCategory;

        emit(
            MilestonesTrailInitial(
            )
        );
    });

    on<MilestonesTrailAddMilestoneEvent>((event, emit) {


      if (currentMilestoneCategory == null) {
        return;
      }

      Milestone newMilestone = Milestone(
        name: event.name,
        yPosition: getNewElementYPosition()

      );

      currentMilestoneCategory!.milestones.add(newMilestone);

      emit(
          MilestonesTrailInitial(
        )
      );

    });

    on<MilestonesTrailCompleteMilestoneEvent>((event, emit) {


      if (currentMilestoneCategory == null) {
        return;
      }

      event.milestone.completed = true;

      emit(
          MilestonesTrailInitial(
          )
      );

    });

    on<MilestonesTrailRemoveMilestoneEvent>((event, emit) {


      if (currentMilestoneCategory == null) {
        return;
      }

      currentMilestoneCategory!.milestones.remove(event.milestone);

      emit(
          MilestonesTrailInitial(
          )
      );

    });


  }

  double getNewElementYPosition() {

    if(currentMilestoneCategory!.milestones.isEmpty){
      return 0;
    }
    return currentMilestoneCategory!.milestones.last.yPosition > 0 ?
      (
          currentMilestoneCategory!.milestones.last.yPosition > 80 ? -1 :
          currentMilestoneCategory!.milestones.last.yPosition + 10

      ) :

      (
          currentMilestoneCategory!.milestones.last.yPosition < -80 ? 1 :
          currentMilestoneCategory!.milestones.last.yPosition - 10
      );
  }
}
