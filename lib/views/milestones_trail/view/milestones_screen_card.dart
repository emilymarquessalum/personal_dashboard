import 'package:flexible_structures/widgets/interactions/on_hover_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/bloc/milestones_trail_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/models/milestone.dart';

class MilestonesScreenCard extends StatelessWidget {
  const MilestonesScreenCard({
    super.key,
    required this.milestone,
  });

  final Milestone milestone;

  @override
  Widget build(BuildContext context) {


    double size = 140;

    double cardSize = 100;

    return OnHover(
      builder: (hovered) {
        return Container(
           // color: Colors.red,
          width: size,
          child: Stack(
                    children: [
           Align(
             alignment: Alignment.topCenter,
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color:
                 milestone.completed ? Colors.green :
                 Colors.yellow,
               ),

               width: cardSize,
               height: cardSize,
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(milestone.name,
                   style: TextStyle(
                     color: Colors.purple
                   ),
                   ),
                 ],
               ),
             ),
           ),

                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: hovered ? 1 : 0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top:
                            size*2/3),
                            child: Container(
                              height: 50,
                              width: size,
                              decoration: BoxDecoration(


                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  if(!milestone.completed)
                                    IconButton(
                                      onPressed: () {
                                        completeMilestone(context);
                                      },
                                      icon: Icon(Icons.check),
                                      color: Colors.green,
                                    ),
                                  IconButton(
                                    onPressed: () {
                                    },
                                    icon: Icon(Icons.info),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      removeMilestone(context);
                                    },
                                    icon: Icon(Icons.remove),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
        );
      }
    );
  }

  void completeMilestone(BuildContext context) {
    context.read<MilestonesTrailBloc>().add(

        MilestonesTrailCompleteMilestoneEvent(
          milestone: milestone
        )
    );
  }

  removeMilestone(BuildContext context){
    context.read<MilestonesTrailBloc>().add(

        MilestonesTrailRemoveMilestoneEvent(
            milestone: milestone
        )
    );
  }
}
