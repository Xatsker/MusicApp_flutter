import 'package:flutter/material.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:piano/piano.dart';

import '../../widgets/modifiedTitleText.dart';

class PracticePage extends StatefulWidget {
  PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  Map<String, Map<String, NoteRange>> practiceData = {
    "bass": {
      "Уровень 1": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 4)),
      "Уровень 2": NoteRange(NotePosition(note: Note.C, octave: 3), NotePosition(note: Note.C, octave: 4)),
      "Уровень 3": NoteRange(NotePosition(note: Note.C, octave: 2), NotePosition(note: Note.C, octave: 4)),
    },
    "alt": {
      "Уровень 1": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 4)),
      "Уровень 2": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 5)),
      "Уровень 3": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 6)),
    },
    "treble": {
      "Уровень 1": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 4)),
      "Уровень 2": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 5)),
      "Уровень 3": NoteRange(NotePosition(note: Note.C, octave: 4), NotePosition(note: Note.C, octave: 6)),
    }
  };

  List<String> levelItems = ["Уровень 1", "Уровень 2", "Уровень 3"];
  String levelSelectedItem = "Уровень 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Практика"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticPage()));
              },
              icon: Icon(Icons.stacked_bar_chart)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                ModifiedTitleText('Practice'),
              ]),
          Padding(padding: const EdgeInsets.all(8.0), child: changeLevel(context, levelItems, levelSelectedItem)),
          const SizedBox(
            height: 33,
          ),
          buildElevatedButton(context, '/treble', 'скрипичный ключ'),
          const SizedBox(
            height: 33,
          ),
          buildElevatedButton(context, '/bass', 'басовый ключ'),
          const SizedBox(
            height: 33,
          ),
          buildElevatedButton(context, '/alt', 'альтовый ключ')
        ],
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context, String path, String title) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, path, arguments: [practiceData[path.substring(1)]![levelSelectedItem], levelSelectedItem]);
      },
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontFamily: "Roboto",
          letterSpacing: 1.5,
        ),
      ),
      style: ElevatedButton.styleFrom(fixedSize: const Size(328, 50), primary: Theme.of(context).primaryColor),
    );
  }

  Widget changeLevel(BuildContext context, List items, String selectedItem) => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          //labelText: "Уровни",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
          ),
        ),
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (item) => setState(
          () => this.levelSelectedItem = item!,
        ),
      );
}
