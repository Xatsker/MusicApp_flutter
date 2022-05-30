import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../models/screens.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Color mainColor = const Color.fromRGBO(2, 119, 189, 1);
  @override
  Widget build(BuildContext context) {
    final screenData = Provider.of<Screens>(context);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screenData.screens,
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
