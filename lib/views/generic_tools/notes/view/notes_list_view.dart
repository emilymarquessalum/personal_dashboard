
import 'package:personal_dashboard/views/home/view/input_text_saved_locally.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notes_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Column(

          children: [

            for(int i = 0; i < context.read<NotesBloc>().notes.length; i+=3)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int j = i; j < i+3; j++)
                       (j < context.read<NotesBloc>().notes.length) ?
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: InputTextSavedLocally(input: context.read<NotesBloc>().notes[j]),
                        )) : Spacer()

                  ],),
              ),



          ],
        );
      }
    );
  }
}
