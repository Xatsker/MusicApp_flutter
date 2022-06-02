import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:music_app/pages/practice/treble_practise_page.dart';
import 'package:piano/piano.dart';
import 'package:provider/provider.dart';
import 'note_logic.dart';

class AltoPractisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestPractisePageState(
      clef: Clef.Alto,
      testType: "Ключ До",
      svgSource: "assets/images/Basoviy.svg");
}

class AltoPractisePageState extends State<AltoPractisePage> {
  AltoPractisePageState({Key? key});

  late NoteTestRunner runner;

  @override
  void initState() {
//
//     var noteInterval = ModalRoute.of(context)?.settings.arguments as NoteRange;
    var noteInterval = NoteRange(
        NotePosition(note: Note.C), NotePosition(note: Note.C, octave: 5));

    runner = NoteTestRunner(10,
        onGenerateNote: () => setState(() {}),
        onTick: () => setState(() {}),
        onTimeEnd: _onEnd,
        noteInterval: noteInterval);
  }

  void _onEnd() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Вы ответили на ${runner.userAnswer.length} заданий. Правильно ${runner.score} раз"),
    ));

    Provider.of<StatisticData>(context, listen: false).addFromScreen(
        "Ключ До",
        SvgPicture.asset("assets/images/Basoviy.svg"),
        runner.score,
        runner.userAnswer.length - runner.score);
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Уровень 1"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child:
                Text("Ключ До", style: Theme.of(context).textTheme.headline3),
          ),
          SizedBox(height: 70),
          ClefImage(
              clef: Clef.Alto,
              noteRange: NoteRange.forClefs([Clef.Alto]),
              // NoteRange(
              //     NotePosition(
              //       note: Note.A,
              //     ),
              //     NotePosition(note: Note.B)),
              noteImages: (runner.currentNote == null)
                  ? []
                  : [
                      NoteImage(notePosition: runner.currentNote!),
                    ],
              clefColor: Colors.black,
              noteColor: Colors.black,
              size: Size(MediaQuery.of(context).size.width - 10, 130)),
          Text(runner.time.toString()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.indigo),
            onPressed: () => runner.start_test(),
            child: Text("НАЧАТЬ"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: InteractivePiano(
              hideScrollbar: true,
              highlightedNotes: [],
              naturalColor: Colors.white,
              accidentalColor: Colors.black,
              keyWidth: 40,
              noteRange: NoteRange(
                  NotePosition(
                    note: Note.C,
                  ),
                  NotePosition(note: Note.B)),
              onNotePositionTapped: (position) {
                runner.checkAnswer(position);
                // Use an audio library like flutter_midi to play the sound
              },
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    runner.End();
    super.dispose();
  }
}
