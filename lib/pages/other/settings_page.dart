import 'package:flutter/material.dart';
import 'package:music_app/theme/config.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  bool _darkModeToggled = false;
  bool _soundModeToggled = false;

  List<String> notesItems = ["C, D, E, F, G, A, H", "До, Ре, Ми"];
  String? notesSelectedItem = "C, D, E, F, G, A, H";
  List<String> languageItems = ["Русский", "English"];
  String? languageSelectedItem = "Русский";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
        width: 240,
        child:
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Обозначения нот",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 3, color: Colors.indigo),
            ),
          ),
            value: notesSelectedItem,
            items: notesItems.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
            ))
            .toList(),
          onChanged: (item) => setState(() => notesSelectedItem = item),
        ),
        ),
        const SizedBox(
          height: 30,
        ),
        SwitchListTile(
          title: const Text("Тёмная тема"),
          value: _darkModeToggled,
          activeColor: Colors.indigo,
          onChanged: (bool value) {
            setState(() => _darkModeToggled = value);
          },
          secondary: const Icon(Icons.dark_mode),
        ),
        const SizedBox(
          height: 30,
        ),
        SwitchListTile(
          title: const Text("Звук"),
          value: _soundModeToggled,
          activeColor: Colors.indigo,
          onChanged: (bool value) {
            setState(() => _soundModeToggled = value);
          },
          secondary: const Icon(Icons.surround_sound),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 240,
          child:
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Язык",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.indigo),
              ),
            ),
            value: languageSelectedItem,
            items: languageItems.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ))
                .toList(),
            onChanged: (item) => setState(() => languageSelectedItem = item),
          ),
        ),
      ]
      ),
    );
  }
}
