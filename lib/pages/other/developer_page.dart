import 'package:flutter/material.dart';
import 'package:music_app/pages/navbar.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);
    final navbar = Provider.of<NavbarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("О разработчике"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        currentIndex: navbar.currentIndex,
        onTap: (index) {
          navbar.onTapPage(context, index);
        },
        items: [
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.home,
              size: 25,
            ),
            title: const Text('Главная'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.menu_book_outlined,
              size: 25,
            ),
            title: const Text('Теория'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.handyman,
              size: 25,
            ),
            title: const Text('Практика'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
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
