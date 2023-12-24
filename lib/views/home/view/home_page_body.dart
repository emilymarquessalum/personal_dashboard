import 'package:personal_dashboard/views/home/bloc/home_bloc.dart';
import 'package:personal_dashboard/views/home/view/input_text_saved_locally.dart';
import 'package:personal_dashboard/views/notes/view/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../shortcuts/view/home_add_link_form_view.dart';
import '../../shortcuts/view/home_links_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.form,
  });

  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          HomeBloc bloc = context.read<HomeBloc>();

          if (state is HomeLoadingLinksState) {
            return CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(

                children: [
                  //    Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text('Home Page - EmilySalum'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Visibility(
                          visible: state is! HomeAddingLinkState,
                          child: HomeLinksListView(bloc: bloc),
                        ),
                        Visibility(
                          visible: state is HomeAddingLinkState,
                          child: HomeAddLinkFormView(form: form, bloc: bloc),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: NotesListView(),
                  ),
                  //Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
