
import 'package:personal_dashboard/views/home/view/input_text_saved_locally.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/views/notes/bloc/notes_bloc.dart';
import 'package:personal_dashboard/views/notes/models/note.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Column(
          children: [

            for (Note input in context.read<NotesBloc>().notes)
              InputTextSavedLocally(input: input),


          ],
        );
      }
    );
  }
}
