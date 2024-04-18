import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/wheel_of_life_bloc.dart';
import '../models/wheel_objective.dart';
import '../styles/wheel_objective_styles.dart';

class WheelOfLifeValuesForm extends StatefulWidget {
  const WheelOfLifeValuesForm({
    super.key,
  });

  @override
  State<WheelOfLifeValuesForm> createState() => _WheelOfLifeValuesFormState();
}

class _WheelOfLifeValuesFormState extends State<WheelOfLifeValuesForm> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WheelOfLifeBloc, WheelOfLifeState>(
      builder: (context, state) {
        WheelOfLifeBloc bloc = context.read<WheelOfLifeBloc>();
        return Container
          (
//      height: 400,
          child: Row(
            children: [


//              Text(bloc.focusedObjective?.name ?? "_",),
              for(var category in bloc.objectiveCategories)

              // true ? Text(category.name) :

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        for(WheelObjective objective in category.objectives)
                          WheelObjectiveFormField(
                            bloc: bloc, objective: objective,)
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class WheelObjectiveFormField extends StatefulWidget {
  const WheelObjectiveFormField({
    super.key,
    required this.bloc,
    required this.objective,
  });

  final WheelOfLifeBloc bloc;
  final WheelObjective objective;

  @override
  State<WheelObjectiveFormField> createState() =>
      _WheelObjectiveFormFieldState();
}

class _WheelObjectiveFormFieldState extends State<WheelObjectiveFormField> {

  FocusNode focusNode = FocusNode();

  TextEditingController controller = TextEditingController();
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTextValue();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        focusOnItem();
      }
    });
  }

  void setTextValue() {

    controller.value = TextEditingValue(
      text:  widget.bloc.record.values[widget.objective.id]?.toString() ?? ""
    );
  }

  void focusOnItem() {
    debugPrint("focus on item");
    context.read<WheelOfLifeBloc>().add(
        WheelOfLifeFocusedItemChangedEvent(
          objective: widget.objective,
        ));
  }

  @override
  Widget build(BuildContext context) {

    /*return ElevatedButton(onPressed: (){

      focusOnItem();
    }, child: Text("fwqwq"));*/
    return BlocListener<WheelOfLifeBloc, WheelOfLifeState>(
      listener: (context, state) {

        if(state is WheelOfLifeLoadedState) {
          setState(() {

            setTextValue();
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: widget.objective.name,
              filled: true,
              fillColor: WheelObjectiveStyles(
                objective: widget.objective,
              ).relatedColor().withAlpha(100),
              /*suffix: CircleAvatar(
                backgroundColor: WheelObjectiveStyles(
                  objective: widget.objective,
                ).relatedColor(),
                child: Container(
                  width: 20,
                  height: 20,
                ),
              )*/
            ),
            onTap: () {
              focusOnItem();
            },
            onTapOutside: (_) {
              focusOnItem();
            },
            onTapAlwaysCalled: true,
            focusNode: focusNode,
            onChanged: (value) =>
                context.read<WheelOfLifeBloc>().add(
                  WheelOfLifeObjectiveUpdatedEvent(
                    objective: widget.objective,
                    value: double.tryParse(value) ?? 0,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
