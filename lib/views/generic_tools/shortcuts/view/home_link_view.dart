import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/system_shortcuts_bloc.dart';
import 'home_add_link_form_view.dart';
import 'home_links_list_view.dart';

class SystemShortcutsView extends StatelessWidget {
  const SystemShortcutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemShortcutsBloc, SystemShortcutsState>(
      builder: (context, state) {

        SystemShortcutsBloc bloc = context.read<SystemShortcutsBloc>();

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Visibility(
                visible: state is! SystemShortcutsAddingLinkState,
                child: SystemShortcutsLinksListView(bloc: bloc),
              ),
              Visibility(
                visible: state is SystemShortcutsAddingLinkState,
                child: SystemShortcutsAddLinkFormView(bloc: bloc),
              ),
            ],
          ),
        );
      },
    );
  }
}
