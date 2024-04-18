import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/system_shortcuts_bloc.dart';

class SystemShortcutsAddLinkFormView extends StatefulWidget {
  const SystemShortcutsAddLinkFormView({
    super.key,
    required this.bloc,
  });


  final SystemShortcutsBloc bloc;

  @override
  State<SystemShortcutsAddLinkFormView> createState() => _SystemShortcutsAddLinkFormViewState();
}

class _SystemShortcutsAddLinkFormViewState extends State<SystemShortcutsAddLinkFormView> {

  late FormGroup form;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    form = FormGroup({
      'url': FormControl<String>(validators: [Validators.required]),
      'title': FormControl<String>(validators: [Validators.required]),

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 360,
      ),
      child: Column(
        children: [
          ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                ReactiveTextField<String>(
                  formControlName: 'url',
                  decoration: InputDecoration(
                    labelText: 'Url',
                  ),
                ),  ReactiveTextField<String>(
                  formControlName: 'title',
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.bloc.add(SystemShortcutsCancelAddLinkEvent());
                      form.reset();
                      },
                    child: Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      widget.bloc.add(SystemShortcutsAddedPathEvent(pathFormData: form.value));
                      form.reset();
                      },
                    child: Text("Confirmar")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
