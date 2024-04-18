import 'dart:html';

import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/data/session_locator.dart';
import 'package:personal_dashboard/routes/router.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_views_bloc.dart';
import 'package:personal_dashboard/views/generic_tools/notes/bloc/notes_bloc.dart';
import 'package:personal_dashboard/views/generic_tools/shortcuts/bloc/system_shortcuts_bloc.dart';
import 'package:personal_dashboard/views/pomodoro_timer/bloc/pomodoro_cubit.dart';
import 'package:personal_dashboard/views/home/home_router.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_page.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_screen.dart';


import 'data/local_storage.dart';

void main() async {

  //setPathUrlStrategy();


  GetIt.I.registerSingleton<LocalStorage>(LocalStorage());

  GetIt.I.registerSingleton<SessionLocator>(SessionLocator());


  runApp( MyApp(
    appRouter:appRouter(
        initialRoute:

        HomeRoute().routePath

        ),
  ));
}


class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter,});
  final GoRouter appRouter;

  // This widget is the root of your application.
  //


  final PageStructuresBloc structuresBloc = PageStructuresBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SystemShortcutsBloc(),
           ),
        BlocProvider(
            create: (context) => NotesBloc()..add(
              NotesLoadEvent()
            ),
           ),
        BlocProvider(
            create: (context) => StackedViewsBloc(),
           ),
        BlocProvider(
            create: (context) => PomodoroCubit(),
           ),
        BlocProvider.value(value: structuresBloc),

      ],
      child: MaterialApp.router(
        title: "Dashboard",
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),

        routerConfig: appRouter,
       // child: MilestonesPage(),
      ),
    );
  }

  ThemeData buildAppTheme() {
    return ThemeData.dark(
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a purple toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.

      useMaterial3: true,

    ).copyWith(

      colorScheme: ThemeData.dark().colorScheme.copyWith(

      secondary: Color(0xFFCD3C93),
    //    secondary: Color(0xFFE341A2),
   //     secondary: Color(0xFF9B3D74),
      ),
    );
  }
}

