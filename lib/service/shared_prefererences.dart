import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future save(String dir, valor) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(dir, json.encode(valor));
  }

  Future get(String dir) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var get = preferences.getString(dir);
    if (get == null) {
      return;
    } else {
      return jsonDecode(get);
    }
  }

  Future remove(String dir) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(dir);
  }
}
