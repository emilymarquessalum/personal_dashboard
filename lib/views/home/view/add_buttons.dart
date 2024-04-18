


import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AddButton extends StatelessWidget {
  final Function() add;
  const AddButton({super.key, required this.add});

  @override
  Widget build(BuildContext context) {



    return ElevatedButton(
        onPressed: add,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          side: MaterialStateProperty.all(
            BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
        ),
        child: Text("+")).clipOval().boxShadow(
      blurRadius: 50,
      color: Colors.black87
    );
  }
}

