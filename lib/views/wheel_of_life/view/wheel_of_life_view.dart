import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/wheel_of_life/bloc/wheel_of_life_bloc.dart';
import 'package:personal_dashboard/views/wheel_of_life/view/wheel_of_life_graph.dart';
import 'package:personal_dashboard/views/wheel_of_life/view/wheel_of_life_values_form.dart';


class WheelOfLifeView extends StatelessWidget {
  const WheelOfLifeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WheelOfLifeBloc(),
      child: Column(
        mainAxisSize: MainAxisSize.min
        ,
        children: [WheelOfLifeGraph(), WheelOfLifeValuesForm()],
      ),
    );
  }
}
