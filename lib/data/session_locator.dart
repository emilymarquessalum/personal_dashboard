



import 'dart:html';

import 'package:personal_dashboard/data/local_storage.dart';
import 'package:get_it/get_it.dart';

import '../views/home/data/links_data_source.dart';

class SessionLocator {




  Future<int> getId() async {


    return 0;

    Uri uri = Uri.parse(window.location.href);
    String parameterValue = ( uri.queryParameters["id"] ?? "");
    if(parameterValue == '') {
      int newId = await  getAvailableSessionId();

      window.history.pushState({}, '', '?id=$newId');
      return newId;
    }

    return int.parse(parameterValue);
  }


  Future<int> getAvailableSessionId() async {

    int i = 0;
    while(true) {
      i++;

      if(GetIt.I.get<LocalStorage>().loadData(
    "session" + i.toString(),
        defaultValue: null,
      )
          != null) {
        continue;
      }
      return i;
    }

  }

  void saveSessionId(int newId) {
    GetIt.I.get<LocalStorage>().saveData(
        "session" + newId.toString(), newId);
  }


}