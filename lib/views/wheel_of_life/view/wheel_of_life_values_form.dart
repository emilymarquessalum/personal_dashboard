import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/wheel_of_life/bloc/wheel_of_life_bloc.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective.dart';

import '../styles/wheel_objective_styles.dart';

class WheelOfLifeValuesForm extends StatelessWidget {
  const WheelOfLifeValuesForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    WheelOfLifeBloc bloc = context.read<WheelOfLifeBloc>();
    return Container
      (
//      height: 400,
      child: Row(
        children: [

          for(var category in bloc.objectiveCategories)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                 // mainAxisSize: MainAxisSize.min,
                  children: [
                    for(WheelObjective objective in category.objectives)
                      Container(
                        height: 50,
                        child: TextFormField(
                          initialValue:
                          bloc.record.values[objective.id]?.toString() ?? ""
                          ,
                          decoration: InputDecoration(
                            labelText: objective.name,
                            suffix: CircleAvatar(
                              backgroundColor: WheelObjectiveStyles(
                                objective: objective,
                              ).relatedColor(),
                              child: Container(
                                width: 20,
                                  height: 20,
                              ),
                            )
                          ),
                          onChanged: (value) => context.read<WheelOfLifeBloc>().add(
                            WheelOfLifeObjectiveUpdatedEvent(
                              objective: objective,
                              value: double.tryParse(value) ?? 0,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
