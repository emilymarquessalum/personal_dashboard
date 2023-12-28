




import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/page_structure.dart';

class PageStructureContainer extends StatelessWidget {

  final PageStructure pageStructure;
  const PageStructureContainer({super.key,
  required this.pageStructure,});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor =
        Colors.grey;

    //return Text("container");
    return Container(

      width: context.width *0.8,
      child: Column(
        children: [
          Container(
            color:backgroundColor,
            child: Row(
              children: [

                InkWell(
                  onTap: () {

                    context.read<PageStructuresBloc>()
                    .add(
                        PageStructuresCloseEvent(
                            pageStructure: pageStructure
                        )
                    );
                    },
                  child: Icon(Icons.close,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color:
              backgroundColor),
              borderRadius: BorderRadius.circular(8)
            ),
            child: pageStructure.child,
          ),
        ],
      ),
    );
  }
}
