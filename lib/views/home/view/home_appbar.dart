


import 'package:common_extensions/extensions/ui/for_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/stacked_view/mdi/mdi_widget.dart';
import '../../../shared/stacked_view/stacked_views_bloc.dart';
import '../../../shared/stacked_view/stacked_views_events.dart';
import '../../milestones_trail/milestones_trail_route.dart';
import '../../mood/models/mood_record.dart';
import '../../mood/widgets/mood_card.dart';
import '../../notes/popups/add_note_mdi.dart';
import '../../user/view/user_welcome_title.dart';
import '../page_structures/bloc/page_structures_bloc.dart';
import '../page_structures/page_catalogue/popups/page_catalogue_popup.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: UserWelcomeTitle(),
      ),
      backgroundColor: Colors.transparent,
      actions: [

        InkWell(
            onTap: () {


              PageCataloguePopup(
                bloc:

                context.read<PageStructuresBloc>()
                ,).showDialogWithWidget
                (context);
            },
            child: Icon(
                Icons.add
            )
        ),
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
              context.read<StackedViewsBloc>().add(
                  AddViewEvent(view:
                  MDIWindowWidget(
                    title: 'Teste',

                  )
                  )
              );
          },
          child: MoodCardIcon(
            moodType: MoodType.good,
            color: Colors.green,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, 50);
}
