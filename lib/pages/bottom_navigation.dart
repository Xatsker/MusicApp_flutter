import 'package:flutter/material.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:music_app/pages/theory/theory_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    TheoryPage(),
    PracticePage(),
    StatisticPage(),
  ];

  Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(
        horizontal: 20,
          vertical: 40,
        ),
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
      SalomonBottomBarItem(
      selectedColor: mainColor,
      icon: const Icon(
      Icons.home,
      size: 25,
      ),
      title: const Text('Главная'),
      ),
      SalomonBottomBarItem(
        selectedColor: mainColor,
        icon: const Icon(
          Icons.menu_book_outlined,
          size: 25,
        ),
        title: const Text('Теория'),
      ),
      SalomonBottomBarItem(
        selectedColor: mainColor,
        icon: const Icon(
          Icons.handyman,
          size: 25,
        ),
        title: const Text('Практика'),
      ),
      SalomonBottomBarItem(
        selectedColor: mainColor,
        icon: const Icon(
          Icons.stacked_bar_chart,
          size: 25,
        ),
        title: const Text('Статистика'),
      ),
      ],
    ),
    );
  }
}
