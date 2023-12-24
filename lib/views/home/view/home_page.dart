import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_views_events.dart';
import 'package:personal_dashboard/views/home/view/home_page_body.dart';
import 'package:personal_dashboard/views/milestones_trail/milestones_trail_route.dart';
import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:personal_dashboard/views/mood/widgets/mood_card.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../shared/stacked_view/mdi/mdi_widget.dart';
import '../../../shared/stacked_view/stacked_views_bloc.dart';
//import '../../../shared_widgets/mdi/mdi_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late FormGroup form;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    form = FormGroup({
      'url': FormControl<String>(validators: [Validators.required]),
      'title': FormControl<String>(validators: [Validators.required]),

    });
  }

  List<Widget> stackedWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          actions: [

            InkWell(
                onTap: () {
                  context.push(MilestonesTrailRoute().routePath);
                },
                child: Icon(
                    Icons.map
                )
            ),
            InkWell(
              onTap: () {
                setState(() {
                  context.read<StackedViewsBloc>().add(
                      AddViewEvent(view:
                      MDIWindowWidget(
                        title: 'Teste',

                      )
                      )
                  );
                });
              },
              child: MoodCardIcon(
                moodType: MoodType.good,
                color: Colors.green,
              ),
            )
          ],
        ),
        body: BlocBuilder<StackedViewsBloc, List<Widget>>(
          builder: (context, state) {
            return Container(
              width: context.width,
              height: context.height,
              child: Stack(
                children: [

                  SingleChildScrollView(child: HomePageBody(form: form)),


                  ...context
                      .read<StackedViewsBloc>()
                      .state,

                ],
              ),
            );
          },
        )
    );
  }
}

