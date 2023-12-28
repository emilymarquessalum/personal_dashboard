import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/page_structure.dart';
import 'package:personal_dashboard/views/home/page_structures/widgets/page_structure_container.dart';

import '../bloc/page_structures_bloc.dart';

class PageStructureView extends StatelessWidget {
  const PageStructureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageStructuresBloc, PageStructuresState>(
      builder: (context, state) {
        return Column(

          children: [

 //           Text(context.read<PageStructuresBloc>().pageStructures.toString()),

            for(PageStructure structure in context
                .read<PageStructuresBloc>()
                .pageStructures)
              PageStructureContainer(pageStructure: structure)

          ],
        );
      },
    );
  }
}
