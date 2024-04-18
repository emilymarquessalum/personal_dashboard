

import 'package:flutter/material.dart';

class PageStructure {

  final Widget child;

  final String name;
  final String description;

  static int _defaultId = 0;

  int idLayer;
  bool useWholeScreen;
  PageStructure({
    required this.child, required  this.name,
    this.description= "",
    this.idLayer = -1,
    this.useWholeScreen= false,

  }) {
    idLayer = _defaultId++;
  }




  toJson() {
    return {
      "child": child,
      "name": name,
      "description": description,
      "idLayer": idLayer
    };
  }

}