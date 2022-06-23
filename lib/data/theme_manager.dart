// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../main.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    // primarySwatch: Colors.grey,
    // primaryColor: Colors.black,
    // brightness: Brightness.dark,
    // backgroundColor: const Color(0xFF212121),
    // accentColor: Colors.white,
    // accentIconTheme: IconThemeData(color: Colors.black),
    // dividerColor: Colors.black12,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(fixedSize: const Size(328, 50), primary: Colors.indigo),
    ),
    primarySwatch: Colors.indigo,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal, color: Colors.white),
    ),
    // primaryColor: Colors.white,
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    cardColor: const Color(0xFF0E1F4D),
  );

  final lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(fixedSize: const Size(328, 50), primary: Colors.indigo),
    ),
    primarySwatch: Colors.indigo,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal, color: Colors.black),
    ),
    brightness: Brightness.light,
    primaryColor: Colors.black,
    cardColor: Colors.white,
    // focusColor: Colors.black,
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}

class StorageManager {
  static void saveData(String key, dynamic value) async {
    if (value is int) {
      settingBox.put(key, value);
    } else if (value is String) {
      settingBox.put(key, value);
    } else if (value is bool) {
      settingBox.put(key, value);
    } else {
      print("Invalid Type");
    }

    // final prefs = await SharedPreferences.getInstance();
    // if (value is int) {
    //   prefs.setInt(key, value);
    // } else if (value is String) {
    //   prefs.setString(key, value);
    // } else if (value is bool) {
    //   prefs.setBool(key, value);
    // } else {
    //   print("Invalid Type");
    // }
  }

  static Future<dynamic> readData(String key) async {
    dynamic obj = await settingBox.get(key);
    // final prefs = await SharedPreferences.getInstance();
    // dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<void> deleteData(String key) async {
    // final prefs = await SharedPreferences.getInstance();
    await settingBox.delete(key);
  }
}
