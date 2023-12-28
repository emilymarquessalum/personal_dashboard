import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:common_extensions/extensions/ui/for_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/home/bloc/home_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/widgets/page_structure_view.dart';
import 'package:personal_dashboard/views/text_editor/view/home_quill_editor.dart';
import 'package:personal_dashboard/views/notes/view/notes_list_view.dart';
import 'package:personal_dashboard/views/todo_bullet_points/view/todo_bullet_points_view.dart';
import 'package:personal_dashboard/views/user/view/user_welcome_title.dart';
import 'package:personal_dashboard/views/wheel_of_life/view/wheel_of_life_view.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../dinosaur/popups/dinosaur_species_pick_popup.dart';
import '../../shortcuts/view/home_add_link_form_view.dart';
import '../../shortcuts/view/home_links_list_view.dart';
import '../page_structures/bloc/page_structures_bloc.dart';
import '../page_structures/page_catalogue/popups/page_catalogue_popup.dart';
import '../page_structures/page_catalogue/widget/page_catalogue_view.dart';

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

                  PageStructureView(),

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

                  //DinosaurSpeciesPickPopup(),
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
