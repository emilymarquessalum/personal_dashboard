import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:personal_dashboard/views/home/page_structures/data/page_structure_loader.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';

part 'page_structures_event.dart';
part 'page_structures_state.dart';

class PageStructuresBloc extends Bloc<PageStructuresEvent, PageStructuresState> {


  List<PageStructure> turnedOnPageStructures = [];

  PageStructuresBloc() : super(PageStructuresInitial()) {
    on<PageStructuresEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PageStructuresCloseEvent>((event, emit) async {
      turnedOnPageStructures.remove(event.pageStructure);
      await save();
      emit(PageStructuresInitial());
    });

    on<PageStructuresAddEvent>((event, emit) async {

      debugPrint("Adding ${event.pageStructure.name}");
      turnedOnPageStructures.add(event.pageStructure);
      await save();
      emit(PageStructuresInitial());
    });

    on<PageStructuresLoadEvent>((event, emit) async {

      List<PageStructure> value = await PageStructureLoader.turnedOnStructuresLoader
          .load(); 
      turnedOnPageStructures = value;
      emit(PageStructuresInitial());
    });

    on<PageStructuresMoveUpEvent>((event, emit) async {
      int index = turnedOnPageStructures.indexOf(event.pageStructure);
      if (index == 0) return;
      turnedOnPageStructures.remove(event.pageStructure);
      turnedOnPageStructures.insert(index - 1, event.pageStructure);
      await save();
      emit(PageStructuresInitial());
    });

    on<PageStructuresMoveDownEvent>((event, emit) async {
      int index = turnedOnPageStructures.indexOf(event.pageStructure);
      if (index == turnedOnPageStructures.length - 1) return;
      turnedOnPageStructures.remove(event.pageStructure);
      turnedOnPageStructures.insert(index + 1, event.pageStructure);
      await save();
      emit(PageStructuresInitial());
    });


    on<PageStructuresMoveTopEvent>((event, emit) async {
      int index = turnedOnPageStructures.indexOf(event.pageStructure);
      if (index == 0) return;
      turnedOnPageStructures.remove(event.pageStructure);
      turnedOnPageStructures.insert(0, event.pageStructure);
      await save();
      emit(PageStructuresInitial());
    });

    on<PageStructuresClearEvent>((event, emit) async {
      turnedOnPageStructures.clear();
      await save();
      emit(PageStructuresInitial());
    });

  }

  Future<void> save() async {
    await PageStructureLoader.turnedOnStructuresLoader.save(turnedOnPageStructures);

  }
}
