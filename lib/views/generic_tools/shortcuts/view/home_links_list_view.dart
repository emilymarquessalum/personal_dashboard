
import 'package:personal_dashboard/views/home/view/add_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../bloc/system_shortcuts_bloc.dart';
import '../models/link.dart';
class SystemShortcutsLinksListView extends StatelessWidget {
  const SystemShortcutsLinksListView({
    super.key,
    required this.bloc,
  });

  final SystemShortcutsBloc bloc;

  @override
  Widget build(BuildContext context)  {
    return Column(
      children: [
        for (SystemLink link in bloc.links)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Chip(
                label:
                InkWell(
                    onTap: (){


                      html.window.open(link.url, 'new tab');

                    },
                    child: Text(link.title)),
                onDeleted: () {
                  bloc.add(SystemShortcutsDeleteLinkEvent(link: link));
                },

                ),
          ),
        AddButton(add: addEvent),
      ],
    );
  }

  void addEvent() {

    bloc.add(SystemShortcutsAddLinkEvent());
  }
}
