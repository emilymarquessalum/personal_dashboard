import 'dart:math';

import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/bloc/milestones_trail_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/models/milestone.dart';
import 'package:personal_dashboard/views/milestones_trail/models/milestone_category.dart';

import 'milestones_screen_card.dart';

class MilestonesScreen extends StatefulWidget {
  const MilestonesScreen({super.key});

  @override
  State<MilestonesScreen> createState() => _MilestonesScreenState();
}

class _MilestonesScreenState extends State<MilestonesScreen> {


  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController;


  }

  @override
  Widget build(BuildContext context) {


    double trailWidth = context.width * 0.94;

    double trailHeight = context.height * 0.9;

    return BlocBuilder<MilestonesTrailBloc, MilestonesTrailState>(
  builder: (context, state) {
    return Column(
      children: [

        Container(
          height: context.height - trailHeight,
          width: context.width,
          child: Row(
            children: [
              Container(
                width: 200,
                child: DropdownButton<MilestoneCategory>(
                  value: context.read<MilestonesTrailBloc>().currentMilestoneCategory,
                  items: [
                  for (int i = 0; i < context.read<MilestonesTrailBloc>()
                      .milestoneCategories.length; i++)
                    DropdownMenuItem<MilestoneCategory>(
                      value: context.read<MilestonesTrailBloc>().milestoneCategories[i],
                      child: Text(context.read<MilestonesTrailBloc>().milestoneCategories[i].categoryName),
                    )
                ],
                  onChanged: (value) {
                  context.read<MilestonesTrailBloc>().add(
                    MilestonesTrailChangeCategoryEvent(
                      milestoneCategory: value as MilestoneCategory
                    )
                  );
                },

                ),
              ),
              IconButton(onPressed: (){
                
              }, icon: Icon(Icons.add)),
            ],
          ),
        ),
        Container(
          height: trailHeight,
          child: Row(
            children: [
              Container(
                width: trailWidth,
                height: trailHeight,
                child: Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  controller: scrollController,
                  child: SingleChildScrollView(
                  controller: scrollController,
                    scrollDirection: Axis.horizontal,

                      child: Stack(
                        alignment: Alignment.centerLeft,
                    children: [

                      for (int i = 0; i <
                          context.read<MilestonesTrailBloc>().milestones
                          .length; i++)
                        Container(
                         // height: context.height,
                         margin: EdgeInsets.only(
                           top:
                           context.height/2 +
                               context.read<MilestonesTrailBloc>().milestones[i].yPosition,
                           left:

                           i * 200  + 20 ,
                         ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MilestonesScreenCard(milestone: context.read<MilestonesTrailBloc>().milestones[i]),
                            ],
                          ),
                        )
                    ],
                  )),
                ),
          ),

              Container(
                width: context.width - trailWidth,
                padding: EdgeInsets.only(right: 12),
                height: trailHeight,
                child: Container(

                  width: context.width - (trailWidth + 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () {
                      context.read<MilestonesTrailBloc>().add(
                          MilestonesTrailAddMilestoneEvent(

                            name: "Milestone ${context.read<MilestonesTrailBloc>().milestones.length + 1}",
                      ));
                    },

                    child: Container(
                      width: context.width - (trailWidth + 12),
                        child: Icon(Icons.add)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  },
);
  }
}
