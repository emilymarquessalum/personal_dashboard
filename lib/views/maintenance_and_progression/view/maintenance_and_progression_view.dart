import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/shared/named_content_container.dart';
import 'package:personal_dashboard/shared/themes/container_theme.dart';
import 'package:personal_dashboard/views/maintenance_and_progression/bloc/maintenance_and_progression_bloc.dart';

class MaintenanceAndProgressionView extends StatelessWidget {
  const MaintenanceAndProgressionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: BlocProvider(
        create: (context) => MaintenanceAndProgressionBloc(),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaintenanceAndProgressionRow(),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: MaintenanceAndProgressionAddField(),
            ),
          ],
        ),
      ),
    );
  }
}

class MaintenanceAndProgressionAddField extends StatefulWidget {
  const MaintenanceAndProgressionAddField({
    super.key,
  });

  @override
  State<MaintenanceAndProgressionAddField> createState() => _MaintenanceAndProgressionAddFieldState();
}

class _MaintenanceAndProgressionAddFieldState extends State<MaintenanceAndProgressionAddField> {


  String _selectedType = "Manutenção";
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Spacer() ,
        Expanded(
          child: Container(

            decoration: ContainerTheme.commonContainerDecoration(context,
                color: Theme.of(context).colorScheme.secondary
            ),
            child: TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              onFieldSubmitted: (value) {
                context.read<MaintenanceAndProgressionBloc>().add(
                    MaintenanceAndProgressionAddEvent(
                        value: _controller.text,
                        type: _selectedType,
                    )
                );
                _focusNode.requestFocus();
                _controller.clear();
              },
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            decoration: ContainerTheme.commonContainerDecoration(context,
                color: Theme.of(context).colorScheme.secondary
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  value: _selectedType,
                  items: [
                for(String type in ["Manutenção", "Progressão"])
                  DropdownMenuItem(child: Text(type), value: type),
              ], onChanged: (item) {

                    if(item == null) {
                      return;
                    }
                    setState(() {
                  _selectedType = item;
                });
              }),
            ),
          ),
        ),

Spacer()


      ],
    );
  }
}

class MaintenanceAndProgressionRow extends StatelessWidget {
  const MaintenanceAndProgressionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Expanded(
          flex: 2,
            child: NamedContentContainer(
              canExpand: false,
          name: 'Manutenção',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MaintenanceAndProgressionBloc,
                  MaintenanceAndProgressionState>(builder: (context, state) {
                return Column(
                  children: [
                    for (String maintenance in context
                        .read<MaintenanceAndProgressionBloc>()
                        .maintenances)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Chip(label: Text(maintenance),
                        onDeleted: () {
                          context.read<MaintenanceAndProgressionBloc>().add(
                              MaintenanceAndProgressionRemoveEvent(
                                  value: maintenance,
                                  type: 'Manutenção'
                              )
                          );
                        },
                        ),
                      )
                  ],
                );
              }),
            ],
          ),
        )),
        Spacer(),
        Expanded(
          flex: 2,
          child: NamedContentContainer(
              canExpand: false,
              name: 'Progressão',
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,              children: [
                  BlocBuilder<MaintenanceAndProgressionBloc,
                      MaintenanceAndProgressionState>(builder: (context, state) {
                    return Column(
                      children: [
                        for (String progression in context
                            .read<MaintenanceAndProgressionBloc>()
                            .progressions)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Chip(label: Text(progression),
                            onDeleted: () {
                              context.read<MaintenanceAndProgressionBloc>().add(
                                  MaintenanceAndProgressionRemoveEvent(
                                      value: progression,
                                      type: 'Progressão'
                                  )
                              );
                            }
                            ),
                          )
                      ],
                    );
                  }),
                ],
              )),
        ),
        Spacer(),
      ],
    );
  }
}
