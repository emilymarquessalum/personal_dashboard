import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wheel_of_life_bloc.dart';


class WheelOfLifeHappinessSlider extends StatelessWidget {
  const WheelOfLifeHappinessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelOfLifeBloc, WheelOfLifeState>(
      builder: (context, state) {
        return ValueSlider(
          title: "JOY (${context
              .read<WheelOfLifeBloc>()
              .happinessValue.floor()
              .toString()})",
          value: context
              .read<WheelOfLifeBloc>()
              .happinessValue,
          onChanged:(value) {

            context.read<WheelOfLifeBloc>().add(
                WheelOfLifeHappinessChangedValue(value: value)
            );
          }
        );
      },
    );
  }
}

class ValueSlider extends StatelessWidget {
  final String title;
  final double value;
  final Function(double) onChanged;
  const ValueSlider({
    super.key, required  this.title, required  this.value, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(width: 16,),
        Text(title),

        SizedBox(width: 12,),
        Slider(

          value: value,
          max: 10,
          onChangeEnd: (double newValue) {

          }, onChanged: (double value) {
            onChanged(value);
        },),
      ],
    );
  }
}
