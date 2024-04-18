import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';

import 'package:flutter/material.dart';


import '../bloc/wheel_of_life_bloc.dart';
import '../models/wheel_objective.dart';
import '../styles/wheel_objective_styles.dart';

class WheelOfLifeGraph extends StatefulWidget {
  const WheelOfLifeGraph({super.key});

  @override
  State<WheelOfLifeGraph> createState() => _WheelOfLifeGraphState();
}

class _WheelOfLifeGraphState extends State<WheelOfLifeGraph> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelOfLifeBloc, WheelOfLifeState>(
      builder: (context, state) {
        WheelOfLifeBloc bloc = context.read<WheelOfLifeBloc>();

        List<Map> data = [];

        for (String key in bloc.record.values.keys) {
          data.add({
            "name": key,
            "value": (bloc.record.getValue(key)),
          });
        }


        //  return Text(data.toString());

        double size = 300;
        debugPrint(
          "graph update"
        );


        Map<String, Variable<Map, dynamic>> variables =
        {
          "name": Variable(accessor: (map) {
            return (map['name']) as String;
          },),
          "value": Variable(accessor: (map) {
            return (map['value']) as num;
          },
            scale: LinearScale(min: 0, max: 10),
          ),
        };

        return Container(
          width: size,
          height: size,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 140, 
                  backgroundColor:
                  bloc.focusedObjective == null ?
                      Colors.white:
                  WheelObjectiveStyles(
                    objective: WheelObjective(name:
                    bloc.focusedObjective!.id
                    ),
                  ).relatedColor(),
                ),  CircleAvatar(
                  radius: 134,
                  backgroundColor: Color(0xff333333),
                ),
                Opacity(
                    opacity: context
                        .read<WheelOfLifeBloc>()
                        .happinessValue/10,
                    child: buildChart(data , variables, getMarks(bloc))),
              ],
            ),
          ),
        );
      },
    );
    return const Placeholder();
  }

  List<Mark<Shape>> getMarks(WheelOfLifeBloc bloc) {
    return [

        IntervalMark(

          color: ColorEncode(
              encoder: (Map<String, dynamic> map) {
                debugPrint("compare ${bloc.focusedObjective?.id} ${map['name']}");

                /* if (bloc.focusedObjective?.id == map['name']) {
              return Colors.white;
            }*/

                return WheelObjectiveStyles(
                  objective: WheelObjective(name: map['name']),
                ).relatedColor() ;
              }
          ),
          /*
              gradient: GradientEncode(

              ),*/

        ),

      ];
  }

  Chart<Map<dynamic, dynamic>> buildChart(List<Map<dynamic, dynamic>> data, Map<String, Variable<Map, dynamic>> variables, List<Mark<Shape>> marks,

      ) {

    WheelOfLifeBloc bloc = context.read<WheelOfLifeBloc>();


    return Chart<Map>(data: data, variables: variables,
            coord: PolarCoord(
                color:

                Color(0xff333333)


            ),

            marks: marks,
          );
  }
}
