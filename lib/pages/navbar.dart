import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:music_app/main.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../models/screens.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    super.initState();
    _saveDeviceId();
  }

  void _saveDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      settingBox.put('ID', iosDeviceInfo.identifierForVendor);
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      settingBox.put('ID', androidDeviceInfo.androidId);
    }
  }

  int currentIndex = 0;
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
