



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wheel_of_life_bloc.dart';
import '../models/wheel_objective.dart';
import '../models/wheel_objective_category.dart';


class WheelOfLifeFocusedItems extends StatelessWidget {
  const WheelOfLifeFocusedItems({super.key});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(
        right: 0
      ),
      child: Row(
        children: [

          for(WheelObjectiveCategory category in context.read<WheelOfLifeBloc>().objectiveCategories)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: DropdownButtonFormField(
                    items: [
                      for(WheelObjective objective in category.objectives)
                        DropdownMenuItem(
                          child: Text(objective.name),
                          value: objective,
                        )
                    ],
                    value: context.read<WheelOfLifeBloc>().focusedObjectives[category],
                    onChanged:
                      (WheelObjective? objective){
                        context.read<WheelOfLifeBloc>().add(
                          WheelOfLifeFocusedObjectiveChangedEvent(
                              objective: objective!, category: category)
                        );
                      },

                ),
              ),
            ),
        ],
      ),
    );
  }
}
