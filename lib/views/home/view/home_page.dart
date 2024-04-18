import 'dart:html';

import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/data/local_storage.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/view/app_background.dart';
import 'package:personal_dashboard/views/home/view/home_appbar.dart';
import 'package:personal_dashboard/views/home/view/home_page_body.dart';

import '../../../shared/stacked_view/stacked_views_bloc.dart';
//import '../../../shared_widgets/mdi/mdi_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageStructuresBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    /// Doesnt work for some reason
    try {

     //  document.documentElement?.requestFullscreen();
    } catch (e) {
      print(e);
    }

    bloc = PageStructuresBloc()..add(
      PageStructuresLoadEvent()
    );

    cursor();
    //pla();
    //player.setLoopMode(LoopMode.all);
  }

  cursor() async {
    //var myCustomCursor = await
    //CustomMouseCursor.asset('myCursorImage.png',  hotX:2, hotY:2 );

  }

  void pla() async {
    //var player = AudioPlayer();
    String song = "assets/sounds/ethereal_beat.mp3";


    //await player.setUrl();
    //player.setVolume(0.5);
    //player.play();
    //player.setLoopMode(LoopMode.all);
  }

  loadStructures() {
  }

  List<Widget> stackedWidgets = [];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Stack(
        children: [
          AppBackground(),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: HomeAppBar(),
              body: BlocBuilder<StackedViewsBloc, List<Widget>>(
                builder: (context, state) {
                  return Container(
                    width: context.width,
                    height: context.height,
                    child: Stack(
                      children: [
                        SingleChildScrollView(child: HomePageBody()),
                        ...context.read<StackedViewsBloc>().state,
                      ],
                    ),
                  );
                },
              )),

        ],
      ),
    );
  }
}
