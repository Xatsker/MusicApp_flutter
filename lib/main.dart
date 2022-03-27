import 'package:flutter/material.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/bottom_navigation.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:music_app/pages/theory/theory_page.dart';
import 'package:music_app/theme/config.dart';
import 'package:music_app/theme/custom_theme.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData.light(),
  initialRoute: '/',
  routes: {
    '/': (context) => BottomNavigation(),
    '/home': (context) => HomePage(),
    '/theory': (context) => TheoryPage(),
    '/practise': (context) => PracticePage(),
    '/statistic': (context) => StatisticPage(),
  },
));