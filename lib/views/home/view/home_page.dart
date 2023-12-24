import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_views_events.dart';
import 'package:personal_dashboard/views/home/view/home_page_body.dart';
import 'package:personal_dashboard/views/milestones_trail/milestones_trail_route.dart';
import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:personal_dashboard/views/mood/widgets/mood_card.dart';
import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/notes/bloc/notes_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../shared/stacked_view/mdi/mdi_widget.dart';
import '../../../shared/stacked_view/stacked_views_bloc.dart';
import '../../notes/popups/add_note_mdi.dart';
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
    return Stack(
      children: [

        Container(
          height: context.height,
          width: context.width,
          child: Image.network(
            "https://media.discordapp.net/attachments/674761602465267730/1188343547565457418/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28313.png?ex=659a2e2c&is=6587b92c&hm=063a3d35b1ce5d4fe85a6bbd7dabbc1771d426e1c3b01dc205637d4a2666d280&=&format=webp&quality=lossless&width=738&height=387",

            fit: BoxFit.cover,
          ),
        ),
        Scaffold(


          backgroundColor: Colors.transparent,
            appBar: AppBar(

              backgroundColor: Colors.transparent,
              actions: [

                InkWell(
                    onTap: () {

                      context.read<StackedViewsBloc>().add(
                        AddViewEvent(view:
                        AddNoteMDI()
                        )
                      );
                    },
                    child: Icon(
                        Icons.text_snippet_outlined
                    )
                ),
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
        ),
      ],
    );
  }
}

