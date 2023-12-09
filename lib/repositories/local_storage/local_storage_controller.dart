import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_controller.g.dart';

class LocalStorageController = LocalStorageControllerBase
    with _$LocalStorageController;

abstract class LocalStorageControllerBase with Store {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<dynamic> getValueByKey(String key) async {
    final SharedPreferences preferences = await _prefs;
    return preferences.get(key);
  }

  Future<bool> removeValueByKey(String key) async {
    final SharedPreferences preferences = await _prefs;
    return preferences.remove(key);
  }

  Future<bool> setStringValue(String key, String value) async {
    final SharedPreferences preferences = await _prefs;
    return preferences.setString(key, value);
  }

  Future<bool> setBoolValue(String key, bool value) async {
    final SharedPreferences preferences = await _prefs;
    return preferences.setBool(key, value);
  }

  Future<bool> setObject(String key, String value) async {
    final SharedPreferences preferences = await _prefs;
    return preferences.setString(key, jsonEncode(value));
  }
}
