


import 'package:personal_dashboard/data/list_model_loader.dart';

import '../models/todo_point.dart';

class ToDoBulletPointsLoader {

  static ListModelLoader<TODOPoint> turnedOnStructuresLoader =
  ListModelLoader<TODOPoint>(key: 'todos',
      fromList: (items) =>
          items.map((e) => TODOPoint.fromJson(e)).toList(),
      toList: (items) =>
          items.map((e) => e.toMap()).toList()

  );
}