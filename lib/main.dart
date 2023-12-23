import 'dart:html';

import 'package:personal_dashboard/data/session_locator.dart';
import 'package:personal_dashboard/views/home/bloc/home_bloc.dart';
import 'package:personal_dashboard/views/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_page.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_screen.dart';
import 'package:personal_dashboard/views/notes/bloc/notes_bloc.dart';

import 'data/local_storage.dart';

void main() async {

  //setPathUrlStrategy();


  GetIt.I.registerSingleton<LocalStorage>(LocalStorage());

  GetIt.I.registerSingleton<SessionLocator>(SessionLocator());


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(
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

      ),
      home:

      MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomeBloc(),
             ),
          BlocProvider(
              create: (context) => NotesBloc(),
             ),
        ],
        child: MilestonesPage(),
      ),
    );
  }
}

