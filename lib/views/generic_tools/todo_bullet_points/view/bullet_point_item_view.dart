import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/home/page_structures/widgets/move_up_and_down_buttons.dart';

import '../models/todo_point.dart';

class BulletPointItemView extends StatelessWidget {
  const BulletPointItemView({
    super.key,
    required this.point,
  });

  final TODOPoint point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          //Icon(Icons.check_box_outline_blank),
          Checkbox(value: point.completed, onChanged: (newValue) {}),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                point.title,
                softWrap: true,
              ),
            ),
          ),
          MoveUpAndDownButtons(
            moveUp: () {

              
            },
            moveDown: () {},
          ),
        ],
      ),
    );
  }
}
