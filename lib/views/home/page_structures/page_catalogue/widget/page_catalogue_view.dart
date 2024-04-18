import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/shared/themes/icons_theme.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure_category.dart';
import 'package:personal_dashboard/views/home/page_structures/page_catalogue/data/system_page_structures.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';


class PageCatalogueView extends StatefulWidget {

  final PageStructuresBloc bloc;

  const PageCatalogueView({
    required this.bloc,
    super.key});

  @override
  State<PageCatalogueView> createState() => _PageCatalogueViewState();
}

class _PageCatalogueViewState extends State<PageCatalogueView> {

  PageStructureCategory? selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCategory = SystemPageCataloguer.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageStructuresBloc, PageStructuresState>(

      bloc: widget.bloc,
      builder: (context, state) {
        return Column(

          children: [


           Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.grey),
               borderRadius: BorderRadius.circular(8).copyWith(
                 bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
               ),
               color: Color(0xff476985),
             ),
             child: Padding(
               padding: const EdgeInsets.only(top: 12.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Spacer(),
                   for(PageStructureCategory category in SystemPageCataloguer.categories)
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                         child: InkWell(
                             onTap: () {
                               setState(() {
                                 selectedCategory = category;
                               });
                             },
                             child: Center(
                               child: Text(category.name,
                                 style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                   color: category == selectedCategory ? Colors.orange : Colors.white,
                                 ),
                               ),
                             )),
                       ),
                     ),

                   Spacer(),
                 ],
               ),
             ),
           ),
            ElevatedButton(onPressed: (){
              for (PageStructure structure in selectedCategory!.structures) {
                if (widget.bloc.turnedOnPageStructures.contains(structure)) {
                  widget.bloc.add(
                      PageStructuresCloseEvent(
                          pageStructure: structure
                      )
                  );
                } else {
                  widget.bloc.add(
                      PageStructuresAddEvent(
                          pageStructure: structure
                      )
                  );
                }
              }
            }, child:
            Text("Toggle all")),
       SizedBox(
         height: 12,
       ),
       for (PageStructure structure in selectedCategory!.structures)
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0,horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      if (widget.bloc.turnedOnPageStructures.contains(structure)) {
                        widget.bloc.add(
                            PageStructuresCloseEvent(
                                pageStructure: structure
                            )
                        );
                        return;
                      }
                      widget.bloc.add(
                          PageStructuresAddEvent(
                              pageStructure: structure
                          )
                      );
                    },
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                          widget.bloc.turnedOnPageStructures.contains(structure) ?
                          Colors.green :
                          Colors.white,
                          child:
                          widget.bloc.turnedOnPageStructures.contains(structure) ?
                          Icon(IconsTheme.completed, color: Colors.green,) : Container(),
                        ),
                        SizedBox(
                          width: 4,
                        ),

                        InkWell(
                            onTap: (){

                              context.pop(structure);

                            },
                            child: Icon(Icons.anchor)),

                      ],
                    ),
                    title: Text(structure.name),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
