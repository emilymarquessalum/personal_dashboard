



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wheel_of_life_bloc.dart';


class WheelOfLifeActions extends StatelessWidget {
  const WheelOfLifeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        ElevatedButton(
          onPressed: () {

            context.read<WheelOfLifeBloc>().add(SaveWheelOfLifeRecord());
            },
          child: Text("Save"),
        ),
        /*
        ElevatedButton(
          onPressed: () {
          },
          child: Text("Reset"),
        ),*/
      ],
    );
  }
}
