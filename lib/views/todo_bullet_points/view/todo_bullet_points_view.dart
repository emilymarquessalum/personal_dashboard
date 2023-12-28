


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/todo_bullet_points/models/todo_point.dart';

class TODOBulletPointsView extends StatelessWidget {
  const TODOBulletPointsView({super.key});

  @override
  Widget build(BuildContext context) {

        // write down the items above as TODOPoint(title: ...)
    List<TODOPoint> points = [
      TODOPoint(title: "Finish dashboard page-structures and page catalogue, and save catalogue selection settings locally"),

      TODOPoint(title: "Create Page-Structure description visualization option"),
      TODOPoint(title: "Make TODO points dynamic! these are written manually into code..."),
      TODOPoint(title: "Make todo points reordable"),
      TODOPoint(title: "Create workspaces instead of simply having an id that can only be set by changing url"),

      TODOPoint(title: "Week-To-Do (to'dos organizados por dia da semana)"),
      TODOPoint(title: "Accountability Chart"),

      TODOPoint(title: "Streak Habits tracker (whenever you do activity you "
          "gain a streak point, if you forget to do you lose all streak points)"),
      TODOPoint(title: "Como foi o dia de hoje? -> mood+productivity tracker"),
      TODOPoint(title: "Set DYNAMIC background image"),
       TODOPoint(title: "Pomodoro feature with graph visualization"),
      TODOPoint(title: "Time to sleep alarm + tracker"),
      TODOPoint(title: "copy link to clickboard"),
      TODOPoint(title: "Keep record of times the link was clicked, with the hour as well!"),
      TODOPoint(title: "Configure group to change name, grid-x value and if it saves the data right away or not;"),
    ];



    return Column(

      children: [

        for(TODOPoint point in points)
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Icon(Icons.check_box_outline_blank),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(point.title,
                  
                    softWrap: true,), 
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
