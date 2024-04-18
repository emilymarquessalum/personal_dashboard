import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/productivity/wheel_of_life/view/wheel_of_life_actions.dart';
import 'package:personal_dashboard/views/productivity/wheel_of_life/view/wheel_of_life_focused_items.dart';
import 'package:personal_dashboard/views/productivity/wheel_of_life/view/wheel_of_life_graph.dart';
import 'package:personal_dashboard/views/productivity/wheel_of_life/view/wheel_of_life_happiness_slider.dart';
import 'package:personal_dashboard/views/productivity/wheel_of_life/view/wheel_of_life_values_form.dart';


import '../bloc/wheel_of_life_bloc.dart';


class WheelOfLifeView extends StatelessWidget {
  const WheelOfLifeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WheelOfLifeBloc()..add(
    WheelOfLifeLoadEvent()
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min
        ,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueSlider(title: 'STRESS',
                    value: 5,
                    onChanged: (value) {
                      print(value);
                    },
                    ),
                    WheelOfLifeHappinessSlider(),
                  ],
                )),
                Expanded(child: WheelOfLifeGraph()),
                Expanded(child: WheelOfLifeActions())
              ],
            ),
          ),
          WheelOfLifeValuesForm(),
          WheelOfLifeFocusedItems(),
        ],
      ),
    );
  }
}
