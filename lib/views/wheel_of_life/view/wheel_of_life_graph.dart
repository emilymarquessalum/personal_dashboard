import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';

import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective_category.dart';

import '../bloc/wheel_of_life_bloc.dart';
import '../styles/wheel_objective_styles.dart';

class WheelOfLifeGraph extends StatelessWidget {
  const WheelOfLifeGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelOfLifeBloc, WheelOfLifeState>(
      builder: (context, state) {

        WheelOfLifeBloc bloc = context.read<WheelOfLifeBloc>();

        List<Map> data = [];

        for(String key in bloc.record.values.keys)
        {
          data.add({
            "name": key,
            "value": (bloc.record.getValue(key)),
          });
        }


      //  return Text(data.toString());
        return Container(
          width: 400 ,
          height: 400, 
          child: Chart<Map>(data: data, variables: {
            "name": Variable(accessor: (map) {


              return (map['name']) as String;
            },),
          "value": Variable(accessor: (map) {

              return (map['value']) as num;
            },
            scale: LinearScale( min: 0, max: 10),
            ),
          },
                   coord: PolarCoord(),
  marks: [

    IntervalMark(

                color: ColorEncode(
                  encoder: (Map<String, dynamic> map) {
                    return WheelObjectiveStyles(
                      objective: WheelObjective(name: map['name']),
                    ).relatedColor();
                  }
                ),
              /*
                gradient: GradientEncode(

                ),*/

              ),


            ],
          ),
        );
      },
    );
    return const Placeholder();
  }
}
