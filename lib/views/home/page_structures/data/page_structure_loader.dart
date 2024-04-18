



import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/data/list_model_loader.dart';
import 'package:personal_dashboard/data/local_storage.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure_category.dart';
import 'package:personal_dashboard/views/home/page_structures/page_catalogue/data/system_page_structures.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';

class PageStructureLoader {

  static ListModelLoader<PageStructure> turnedOnStructuresLoader =
  ListModelLoader<PageStructure>(key: 'pageStructuresOn',
      fromList: (items) {

        List<PageStructure> structures = [];
        for(PageStructureCategory category in SystemPageCataloguer.categories) {


          structures += items.map((e) {


            return category.structures.firstWhere((element) => element.name == e,
            orElse: ()=> PageStructure(name: "Not Found", child: Container(), description: "Not Found")
            );
          }).toList();


        }


        return structures.where((element) => element.name != "Not Found").toList();
      },
      toList: (items) => items.map((e) => e.name).toList()

  );


}