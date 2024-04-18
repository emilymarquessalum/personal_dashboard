import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/shared/named_content_container.dart';
import 'package:personal_dashboard/shared/themes/container_theme.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';
import 'package:personal_dashboard/views/home/page_structures/widgets/move_up_and_down_buttons.dart';

class PageStructureContainer extends StatefulWidget {
  final PageStructure pageStructure;
  const PageStructureContainer({
    super.key,
    required this.pageStructure,
  });

  @override
  State<PageStructureContainer> createState() => _PageStructureContainerState();
}

class _PageStructureContainerState extends State<PageStructureContainer> {



  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.secondary;




    return Container(  width:

    context.width * (

        widget.pageStructure.useWholeScreen ? 1 :
        0.8),
      child: NamedContentContainer(
        backgroundColor: backgroundColor,
        child: widget.pageStructure.child,
        name: widget.pageStructure.name,
        actions:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MoveUpAndDownButtons(
                moveDown: () {
                  context.read<PageStructuresBloc>().add(
                      PageStructuresMoveDownEvent(
                          pageStructure: widget.pageStructure));
                },
                moveUp: () {
                  context.read<PageStructuresBloc>().add(
                      PageStructuresMoveUpEvent(
                          pageStructure: widget.pageStructure));
                },
              ),
              Tooltip(
                  message: widget.pageStructure.description,
                  child: Icon(Icons.info)),
              InkWell(
                onTap: () {
                  context.read<PageStructuresBloc>().add(
                      PageStructuresCloseEvent(
                          pageStructure: widget.pageStructure));
                },
                child: Icon(
                  Icons.close,
                ),
              )
            ],
          ),

      ),
    );


  }
}
