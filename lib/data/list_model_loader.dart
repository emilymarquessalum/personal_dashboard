



import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/data/local_storage.dart';

class ListModelLoader<T> {

  final String key;
  final List<T> Function(List items) fromList;
  final List Function(List<T> items) toList;

  ListModelLoader({required this.key,
  required this.fromList,
required this.toList
  });

  Future<List<T>> load() async {

    List<dynamic> items = (await GetIt.I.get<LocalStorage>()
        .loadData<List>(key,
        defaultValue: []))!;


    return fromList(items);

  }


  save(List<T> structures) async {
    GetIt.I.get<LocalStorage>().saveData(key,
        toList(structures));
  }

}