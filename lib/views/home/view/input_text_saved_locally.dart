import 'package:common_extensions/extensions/basic_types/for_date_time.dart';
import 'package:personal_dashboard/data/local_storage.dart';
import 'package:personal_dashboard/data/session_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generic_tools/notes/bloc/notes_bloc.dart';
import '../../generic_tools/notes/models/note.dart';

class InputTextSavedLocally extends StatefulWidget {
  const InputTextSavedLocally({
    super.key,
    required this.input,
  });

  final Note input;

  @override
  State<InputTextSavedLocally> createState() => _InputTextSavedLocallyState();
}

class _InputTextSavedLocallyState extends State<InputTextSavedLocally> {

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadText();

  }



  loadText() async {

    textController.value = TextEditingValue(
      text: widget.input.noteContent,
      selection: TextSelection.fromPosition(
        TextPosition(offset:  widget.input.noteContent.length),
      ),
    );

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.input.noteName),
        TextFormField(
          minLines: 4,
         maxLines: 100,
          //expands: true,
          controller: textController,
          onChanged: (value) async {


            debugPrint("value: $value");
            widget.input.noteContent = value;
            context.read<NotesBloc>().add(
              UpdateNoteEvent(
                note: widget.input,
              ),
            );

            },

          decoration: InputDecoration(

            suffixIcon: Column(
              children: [
                Tooltip(
                    message:
                    widget.input.lastChangeDate.toAmericanDisplay()
                    ,
                    child: Icon(Icons.info)),
                InkWell(
                  onTap: (){
                    context.read<NotesBloc>().add(
                      NotesDeleteEvent( widget.input,
                      )
                    );
                  },
                  child: Icon(
                    Icons.delete
                  ),
                ),
              ],
            ),
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          )),
        ),
      ],
    );
  }
}
