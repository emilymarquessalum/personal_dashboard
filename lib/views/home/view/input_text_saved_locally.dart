import 'package:personal_dashboard/data/local_storage.dart';
import 'package:personal_dashboard/data/session_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../notes/models/note.dart';

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

    String newValue =await GetIt.I.get<LocalStorage>().loadData<String>(
        widget.input.noteName) ?? "";
    textController.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newValue.length),
      ),
    );

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.input.noteName),
        TextFormField(
          minLines: 4,
          maxLines: 100,
          controller: textController,
          onChanged: (value) async {


            GetIt.I.get<LocalStorage>().saveData(
                widget.input.noteName +
                    (  await GetIt.I.get<SessionLocator>().getId()
            ).toString()            , value);


            },

          decoration: InputDecoration(
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
