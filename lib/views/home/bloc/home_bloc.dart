import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:personal_dashboard/data/session_locator.dart';
import 'package:personal_dashboard/views/home/data/links_data_source.dart';
import 'package:personal_dashboard/views/home/models/link.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {


  LinksDataSource linksDataSource = TabLinksDataSource();

  List<SystemLink> links = [];
  
  HomeBloc() : super(HomeInitialState()) {


    on<HomeAddLinkEvent>((event, emit) {
        emit(HomeAddingLinkState());
    });

    on<HomeDeleteLinkEvent>((event, emit) async {
        emit(HomeInitialState());
        links.remove(event.link);

        int newId = await GetIt.I.get<SessionLocator>().getId();
        linksDataSource.saveLinks(links, newId);


        GetIt.I.get<SessionLocator>().saveSessionId(newId);
    });

    on<HomeAddedPathEvent>((event, emit)
    async {

      SystemLink link = SystemLink.fromJson(event.pathFormData);

      links.add(link);

      int newId = await GetIt.I.get<SessionLocator>().getId();
      linksDataSource.saveLinks(links, newId);

      emit(HomeInitialState());

      GetIt.I.get<SessionLocator>().saveSessionId(newId);

    });



    loadLinks();

  }



  loadLinks() async {

    emit(HomeLoadingLinksState());

    int id = await GetIt.I.get<SessionLocator>().getId() ;


    debugPrint("going to load with id" + id.toString());
    links = await linksDataSource.getLinks(id);

    debugPrint(links.toString());

    emit(HomeInitialState());
  }



}
