import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:personal_dashboard/views/home/page_structures/page_structure.dart';

part 'page_structures_event.dart';
part 'page_structures_state.dart';

class PageStructuresBloc extends Bloc<PageStructuresEvent, PageStructuresState> {


  List<PageStructure> pageStructures = [];

  PageStructuresBloc() : super(PageStructuresInitial()) {
    on<PageStructuresEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PageStructuresCloseEvent>((event, emit) {
      pageStructures.remove(event.pageStructure);
      emit(PageStructuresInitial());
    });

    on<PageStructuresAddEvent>((event, emit) {

      debugPrint("Adding ${event.pageStructure.name}");
      pageStructures.add(event.pageStructure);
      emit(PageStructuresInitial());
    });

  }
}
