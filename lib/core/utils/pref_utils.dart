import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setStatus(String value) {
    return _sharedPreferences!.setString('status', value);
  }

  String getStatus() {
    try {
      return _sharedPreferences!.getString('status') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setMessage(String value) {
    return _sharedPreferences!.setString('message', value);
  }

  String getMessage() {
    try {
      return _sharedPreferences!.getString('message') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setCounterr(int value) {
    return _sharedPreferences!.setInt('counterr', value);
  }

  int getCounterr() {
    try {
      return _sharedPreferences!.getInt('counterr') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setPref(int value) {
    return _sharedPreferences!.setInt('pref', value);
  }

  int getPref() {
    try {
      return _sharedPreferences!.getInt('pref') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setPagecount(int value) {
    return _sharedPreferences!.setInt('pagecount', value);
  }

  int getPagecount() {
    try {
      return _sharedPreferences!.getInt('pagecount') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setCrr(int value) {
    return _sharedPreferences!.setInt('crr', value);
  }

  int getCrr() {
    try {
      return _sharedPreferences!.getInt('crr') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setWw(int value) {
    return _sharedPreferences!.setInt('ww', value);
  }

  int getWw() {
    try {
      return _sharedPreferences!.getInt('ww') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setEe(bool value) {
    return _sharedPreferences!.setBool('ee', value);
  }

  bool getEe() {
    try {
      return _sharedPreferences!.getBool('ee') ?? false;
    } catch (e) {
      return false;
    }
  }
}
