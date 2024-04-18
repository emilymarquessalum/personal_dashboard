import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todopoints_bloc.dart';
import '../models/todo_point.dart';
import 'bullet_point_item_view.dart';


class TODOBulletPointsView extends StatelessWidget {
  const TODOBulletPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    // write down the items above as TODOPoint(title: ...)

    return BlocProvider(
      create: (context) => TODOPointsBloc(),
      child: TODOBulletPointsBody(),
    );
  }
}

class TODOBulletPointsBody extends StatelessWidget {
  const TODOBulletPointsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    TODOPointsBloc bloc = context.read<TODOPointsBloc>();

    return Column(
      children: [
        Text("${
            bloc.points
                .where((element) => element.completed)
                .length
        }/${bloc.points.length}"),
        ElevatedButton(onPressed: () {}, child: Text("clear dones")),
        for (TODOPoint point in bloc.points) BulletPointItemView(point: point)
      ],
    );
  }
}
