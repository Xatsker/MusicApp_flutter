import 'package:flutter/cupertino.dart';

import '../pages/home_page.dart';
import '../pages/practice/practice_page.dart';
import '../pages/statistic/statistic_page.dart';
import '../pages/theory/theory_main_page.dart';

class Screens with ChangeNotifier{
 final List<Widget> _screens = [
    HomePage(),
    TheoryPage(),
    PracticePage(),
    StatisticPage(),
  ];

  List<Widget> get screens {
   return [..._screens];
 }
}

