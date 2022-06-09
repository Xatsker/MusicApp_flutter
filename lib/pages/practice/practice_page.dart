import 'package:flutter/material.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:piano/piano.dart';

class PracticePage extends StatefulWidget {
  PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {

  Map<String, Map<String, NoteRange>> practiceData = {
    "bass": {
      "Уровень 1" : NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 5)),
      "Уровень 2" : NoteRange(NotePosition(note: Note.C, octave: 3),
          NotePosition(note: Note.C, octave: 5)),
      "Уровень 3" :  NoteRange(NotePosition(note: Note.C, octave: 2),
          NotePosition(note: Note.C, octave: 5)),
    },
    "alt": {
      "Уровень 1" : NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 5)),
      "Уровень 2" :  NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 6)),
      "Уровень 3" :  NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 7)),
    },
    "treble": {
      "Уровень 1" :  NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 5)),
      "Уровень 2" :  NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 6)),
      "Уровень 3" :   NoteRange(NotePosition(note: Note.C, octave: 4),
          NotePosition(note: Note.C, octave: 7)),
    }
  };


  List<String> levelItems = ["Уровень 1", "Уровень 2", "Уровень 3"];
  String levelSelectedItem = "Уровень 1";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeLevel(levelItems, levelSelectedItem);
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Практика"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatisticPage()));
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
                const Text(
                  'Practice',
                  style: TextStyle(
                      fontFamily: "ReenieBeanie",
                      fontSize: 70,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ]),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: changeLevel(levelItems, levelSelectedItem)),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => TreblePractisePage()));
              Navigator.pushNamed(context, "/treble", arguments: [practiceData["treble"]![levelSelectedItem], levelSelectedItem]);
            },
            child: const Text(
              'СКРИПИЧНЫЙ КЛЮЧ',
              style: TextStyle(
                fontFamily: "Roboto",
                letterSpacing: 1.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.indigo),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => BassPractisePage())
              // );
              Navigator.pushNamed(context, "/bass", arguments: [practiceData["bass"]![levelSelectedItem], levelSelectedItem]);
             // Navigator.pushNamed(context, "/bass", arguments: []);
            },
            child: const Text(
              'БАСОВЫЙ КЛЮЧ',
              style: TextStyle(
                fontFamily: "Roboto",
                letterSpacing: 1.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.indigo),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AltoPractisePage()),
              // );
              // Navigator.pushNamed(context, "/alt", arguments: []);
              Navigator.pushNamed(context, "/alt", arguments: [practiceData["alt"]![levelSelectedItem], levelSelectedItem]);

            },

            child: const Text(
              'АЛЬТОВЫЙ КЛЮЧ',
              style: TextStyle(
                fontFamily: "Roboto",
                letterSpacing: 1.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.indigo),
          ),
        ],
      ),
    );
  }

  Widget changeLevel(List items, String selectedItem) =>
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          //labelText: "Уровни",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 3, color: Colors.indigo),
          ),
        ),
        value: selectedItem,
        items: items
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ))
            .toList(),
        onChanged: (item) =>
            setState(
                  () => this.levelSelectedItem = item!,
            ),
      );
}
