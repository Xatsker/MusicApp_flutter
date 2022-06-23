import 'package:flutter/material.dart';
import 'package:music_app/pages/navbar.dart';
import 'package:music_app/widgets/modifiedTitleText.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // var box = Hive.box('setting');
  bool _darkModeToggled = false;
  bool _soundModeToggled = false;

  @override
  void initState() {
    _soundModeToggled = settingBox.get('setting_sound') ?? false;
    super.initState();
  }

  List<String> notesItems = ["C, D, E, F, G, A, H", "До, Ре, Ми"];
  String? notesSelectedItem = "C, D, E, F, G, A, H";
  List<String> languageItems = ["Русский", "English"];
  String? languageSelectedItem = "Русский";

  @override
  Widget build(BuildContext context) {
    final navbar = Provider.of<NavbarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        ModifiedTitleText('Settings'),
        const SizedBox(
          height: 40,
        ),
        // SwitchListTile(
        //   title: const Text("Тёмная тема"),
        //   value: _darkModeToggled,
        //   activeColor: Theme.of(context).primaryColor,
        //   onChanged: (bool value) {
        //     setState(() => _darkModeToggled = value);
        //   },
        //   secondary: Icon(Icons.dark_mode),
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        SwitchListTile(
          title: const Text("Звук"),
          value: _soundModeToggled,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool value) {
            setState(() => _soundModeToggled = value);
            settingBox.put('setting_sound', value);
          },
          secondary: Icon(Icons.surround_sound),
        ),
        const SizedBox(
          height: 60,
        ),
      ]),
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
