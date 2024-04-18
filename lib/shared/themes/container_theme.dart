


import 'package:flutter/material.dart';

class ContainerTheme {


  static BoxDecoration commonContainerDecoration(BuildContext context,
      { Color? color}) =>

      BoxDecoration(
          border: Border.all(color: color ?? Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8));
}