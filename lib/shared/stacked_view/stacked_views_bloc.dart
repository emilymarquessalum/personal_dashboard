



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_view_controller.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_views_events.dart';
import 'package:provider/provider.dart';

class StackedViewsBloc extends Bloc<StackedViewsEvent, List<Widget>> {

  StackedViewsBloc() : super([]) {


    on<AddViewEvent>((event, emit) {


      StackedViewController controller = StackedViewController();

      Widget view =
      Provider<StackedViewController>(
        key: UniqueKey(),
        create: (context) => controller,
        child: event.view,
      );

      emit([
        ...state,
        view
      ]);

      controller.onRemove = () {
        debugPrint("aaaaaaaaa");
        removeView(view);
      };

    });


    on<RemoveViewEvent>((event, emit) {
      emit([
        ...state..remove(event.view)
      ]);
    });

  }

  removeView(Widget view) {
    add(RemoveViewEvent(view: view));
  }

}