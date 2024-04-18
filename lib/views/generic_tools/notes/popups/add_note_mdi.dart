



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_dashboard/shared/stacked_view/mdi/mdi_widget.dart';

import '../bloc/notes_bloc.dart';

class AddNoteMDI extends StatefulWidget {
  const AddNoteMDI({super.key});

  @override
  State<AddNoteMDI> createState() => _AddNoteMDIState();
}

class _AddNoteMDIState extends State<AddNoteMDI> {

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MDIWindowWidget(

        height: 300,
        title: "Adicionar nota",

      child:


        Column(
          children: [
            Spacer(),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome da nota',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {

                context.read<NotesBloc>().add(
                    NotesAddEvent(
                        controller.text
                    )
                );
              },
              child: const Text('Criar'),
            )
          ],
        )
    );
  }
}
