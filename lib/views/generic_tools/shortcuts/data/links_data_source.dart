



import 'dart:convert';

import 'package:personal_dashboard/data/local_storage.dart';
import 'package:get_it/get_it.dart';

import '../models/link.dart';

abstract class LinksDataSource {

  Future<List<SystemLink>> getLinks(int sessionId);
  Future<void> saveLinks(List<SystemLink> links, int sessionId);

}


class TabLinksDataSource extends LinksDataSource {

  String linksKey = 'links';


  @override
  Future<List<SystemLink>> getLinks(int sessionId) async {


    return (await GetIt.I.get<LocalStorage>().loadData<List>(
        linksKey

            + sessionId.toString() ,
      defaultValue: [],
    ))!.map<SystemLink>(
            (e) => SystemLink.fromJson(e)).toList();
  }

  @override
  Future<void> saveLinks(List<SystemLink> links, int sessionId)  async {


    GetIt.I.get<LocalStorage>().saveData(linksKey + sessionId.toString(),
        links);
  }



}