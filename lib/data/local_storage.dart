


import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:web/web.dart' as html;



class LocalStorage {



  saveData(String key, dynamic value) async {

    debugPrint("saving data: $value");
    html.window.localStorage.setItem(key,
        jsonEncode(value));
  }

  Future<T?> loadData<T>(String key, {
    T? defaultValue}) async {
    String? data = html.window.localStorage.getItem(key);

    if(data == null) {
      return defaultValue;
    }

    debugPrint("data: $data");
    return jsonDecode(data);
  }

}