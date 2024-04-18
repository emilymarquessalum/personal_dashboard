


import 'package:duration_picker/duration_picker.dart';
import 'package:flexible_structures/widgets/popups/template_popup.dart';
import 'package:flutter/material.dart';

class SelectDurationPopup extends StatelessWidget {
  final int? initialSeconds;
  const SelectDurationPopup({super.key, this. initialSeconds});

  @override
  Widget build(BuildContext context) {

    return DurationPickerDialog(
        initialTime: Duration(
          minutes: initialSeconds == null ? 30 : 0,
          seconds: initialSeconds ?? 0,
        ));
    return const TemplatePopup(
        child: Column(
          children: [



          ],
        )

    );
  }
}
