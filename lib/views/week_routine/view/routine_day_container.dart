import 'package:flutter/material.dart';
import 'package:personal_dashboard/shared/named_content_container.dart';
import 'package:personal_dashboard/shared/themes/container_theme.dart';
import 'package:personal_dashboard/views/week_routine/models/routine_day.dart';
import 'package:personal_dashboard/views/week_routine/models/routine_item.dart';

class RoutineDayContainer extends StatefulWidget {
  final RoutineDay routineDay;

  const RoutineDayContainer({super.key, required this.routineDay});

  @override
  State<RoutineDayContainer> createState() => _RoutineDayContainerState();
}

class _RoutineDayContainerState extends State<RoutineDayContainer> {
  bool inAddMode = false;

  @override
  Widget build(BuildContext context) {
    return NamedContentContainer(
        canExpand: false,
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  for (RoutineItem item in widget.routineDay.routineItems)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(item.name),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  child: inAddMode
                      ? TextFormField(
                          onFieldSubmitted: (value) {
                            setState(() {
                              widget.routineDay.routineItems
                                  .add(RoutineItem(name: value));
                              inAddMode = false;
                            });
                          },
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              inAddMode = !inAddMode;
                            });
                          },
                          child: Container(
                              decoration:
                                  ContainerTheme.commonContainerDecoration(
                                      context),
                              child: Icon(Icons.add))),
                ),
              )
            ],
          ),
        ),
        name: widget.routineDay.day);
  }
}
