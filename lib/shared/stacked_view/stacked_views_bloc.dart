



/*

import 'package:daily_organization/shared/stacked_views_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StackedViewsBloc extends Bloc<StackedViewsEvent, List<Widget>> {

  StackedViewsBloc() : super([]) {
    on<StackedViewsEvent>((event, emit) {
      if(event is AddViewEvent) {
        emit([...state, event.view]);
      } else if(event is RemoveViewEvent) {
        emit([...state]..remove(event.view));
      }
    });
  }

}*/