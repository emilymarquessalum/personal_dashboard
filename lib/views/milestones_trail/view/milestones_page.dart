import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/bloc/milestones_trail_bloc.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_screen.dart';

class MilestonesPage extends StatelessWidget {
  const MilestonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      BlocProvider(
        create: (context) => MilestonesTrailBloc(),
        child: MilestonesScreen(),
      ),
    );
  }
}
