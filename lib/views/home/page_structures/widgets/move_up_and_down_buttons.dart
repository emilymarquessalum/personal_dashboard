import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';

class MoveUpAndDownButtons extends StatelessWidget {
  const MoveUpAndDownButtons({
    super.key,

    required this.moveUp,
    required this.moveDown,
  });

  final Function() moveUp;
  final Function() moveDown;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: moveUp,
            icon: Icon(Icons.arrow_drop_up)),
        IconButton(
            onPressed: moveDown,
            icon: Icon(Icons.arrow_drop_down)),
      ],
    );
  }
}
