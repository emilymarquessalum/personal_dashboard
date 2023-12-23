import 'package:personal_dashboard/views/home/bloc/home_bloc.dart';
import 'package:personal_dashboard/views/home/models/link.dart';
import 'package:personal_dashboard/views/home/view/add_buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;
import 'dart:html' as html;
class HomeLinksListView extends StatelessWidget {
  const HomeLinksListView({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

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
                  bloc.add(HomeDeleteLinkEvent(link: link));
                },

                ),
          ),
        AddButton(add: addEvent),
      ],
    );
  }

  void addEvent() {

    bloc.add(HomeAddLinkEvent());
  }
}
