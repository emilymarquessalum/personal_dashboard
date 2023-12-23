import 'package:personal_dashboard/views/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeAddLinkFormView extends StatelessWidget {
  const HomeAddLinkFormView({
    super.key,
    required this.form,
    required this.bloc,
  });

  final FormGroup form;
  final HomeBloc bloc;

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
          ElevatedButton(
              onPressed: () {
                bloc.add(HomeAddedPathEvent(pathFormData: form.value));
                form.reset();
                },
              child: Text("Confirmar")),
        ],
      ),
    );
  }
}
