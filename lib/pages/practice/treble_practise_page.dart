import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:piano/piano.dart';
import 'package:provider/provider.dart';
import 'note_logic.dart';

class TreblePractisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TreblePractisePageState();
}

class TreblePractisePageState extends State<TreblePractisePage> {
  TreblePractisePageState({Key? key});

  late NoteTestRunner runner;

  @override
  void initState() {
    runner = NoteTestRunner(3,
        onGenerateNote: () => setState(() {}),
        onTick: () => setState(() {}),
        onTimeEnd: _onEnd);
  }


  String _value = 'assets/GrandPiano.sf2';

  void _onEnd() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Вы ответили на ${runner.userAnswer.length} заданий. Правильно ${runner.score} раз"),
    ));

    Provider.of<StatisticData>(context, listen: false).addFromScreen(
        "Скрипичный ключ",
        SvgPicture.asset("assets/images/Skripichniy.svg"),
        runner.score,
        runner.userAnswer.length - runner.score);
  }

  void _play(int midi) {
    if (kIsWeb) {
      // WebMidi.play(midi);
    } else {
    }
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextButton(child: Text("Скрипичный ключ"), /*style: Theme.of(context).textTheme.headline3,*/ onPressed: () => _play(60)),
              ),
          SizedBox(height: 70),
          ClefImage(
              clef: Clef.Treble,
              noteRange: NoteRange.forClefs([Clef.Treble]),
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
                _play(60);
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
  }
}
