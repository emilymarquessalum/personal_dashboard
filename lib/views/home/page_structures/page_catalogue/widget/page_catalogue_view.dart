import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/page_catalogue/data/system_page_structures.dart';
import 'package:personal_dashboard/views/home/page_structures/page_structure.dart';


class PageCatalogueView extends StatelessWidget {

  final PageStructuresBloc bloc;

  const PageCatalogueView({
    required this.bloc,
    super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageStructuresBloc, PageStructuresState>(

      bloc: bloc,
      builder: (context, state) {
        return Column(

          children: [
       for (PageStructure structure in structures)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  onTap: () {
                    if (bloc.pageStructures.contains(structure)) {
                      bloc.add(
                          PageStructuresCloseEvent(
                              pageStructure: structure
                          )
                      );
                      return;
                    }
                    bloc.add(
                        PageStructuresAddEvent(
                            pageStructure: structure
                        )
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                    bloc.pageStructures.contains(structure) ?
                    Icon(Icons.check, color: Colors.green,) : Container(),
                  ),
                  title: Text(structure.name),
                ),
              ),
          ],
        );
      },
    );
  }
}
