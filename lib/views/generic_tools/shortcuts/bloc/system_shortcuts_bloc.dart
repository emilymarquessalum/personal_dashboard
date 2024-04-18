

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/session_locator.dart';
import '../data/links_data_source.dart';
import '../models/link.dart';
part 'home_state.dart';
part 'home_event.dart';


class SystemShortcutsBloc extends Bloc<SystemShortcutsEvent, SystemShortcutsState> {


  LinksDataSource linksDataSource = TabLinksDataSource();

  List<SystemLink> links = [];
  
  SystemShortcutsBloc() : super(SystemShortcutsInitialState()) {


    on<SystemShortcutsAddLinkEvent>((event, emit) {
        emit(SystemShortcutsAddingLinkState());
    });

    on<SystemShortcutsDeleteLinkEvent>((event, emit) async {
        emit(SystemShortcutsInitialState());
        links.remove(event.link);

        int newId = await GetIt.I.get<SessionLocator>().getId();
        linksDataSource.saveLinks(links, newId);


        GetIt.I.get<SessionLocator>().saveSessionId(newId);
    });

    on<SystemShortcutsAddedPathEvent>((event, emit)
    async {

      SystemLink link = SystemLink.fromJson(event.pathFormData);

      links.add(link);

      int newId = await GetIt.I.get<SessionLocator>().getId();
      linksDataSource.saveLinks(links, newId);

      emit(SystemShortcutsInitialState());

      GetIt.I.get<SessionLocator>().saveSessionId(newId);

    });

    on<SystemShortcutsCancelAddLinkEvent>((event, emit) {
      emit(SystemShortcutsInitialState());
    });


    loadLinks();

  }



  loadLinks() async {

    emit(SystemShortcutsLoadingLinksState());

    int id = await GetIt.I.get<SessionLocator>().getId() ;


    debugPrint("going to load with id" + id.toString());
    links = await linksDataSource.getLinks(id);

    debugPrint(links.toString());

    emit(SystemShortcutsInitialState());
  }



}
