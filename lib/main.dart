import 'package:flutter/material.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/bottom_navigation.dart';
import 'package:music_app/pages/practise_page.dart';
import 'package:music_app/pages/statistic_page.dart';
import 'package:music_app/pages/theory_page.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
      scaffoldBackgroundColor: Colors.white
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => BottomNavigation(),
    '/home': (context) => HomePage(),
    '/theory': (context) => TheoryPage(),
    '/practise': (context) => PractisePage(),
    '/statistic': (context) => StatisticPage(),
  },
));