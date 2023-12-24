


import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/data/local_storage.dart';
import 'package:request_states/requests/state_response.dart';

abstract class NotesDataSource {
  Future<StateResponse> getNotes();

  Future<void> saveNotes(List notes);
}



class NotesDataSourceImpl implements NotesDataSource {
  @override
  Future<StateResponse> getNotes() async {
    // load from local storage of web

    List notes  = (await GetIt.I.get<LocalStorage>().loadData<List>(
      "notes",
      defaultValue: []
    ))!;

    return StateResponse.success(data: {
      "data":notes
    });

  }

  @override
  Future<void> saveNotes(List notes) {
    // save to local storage of web

    GetIt.I.get<LocalStorage>().saveData("notes", notes);
    return Future.value();
  }

}