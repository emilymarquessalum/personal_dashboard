


import 'package:flutter/material.dart';

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
              width: 2,
            ),
          ),
        ),
        child: Text("+"));
  }
}

