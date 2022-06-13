import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:piano/piano.dart';
import 'package:provider/provider.dart';
import 'note_logic.dart';

class TestPractisePage extends StatefulWidget {
  final Clef clef;
  final String svgSource;
  final String testType;

  // TestPractisePage(
  //     {Key? key,
  //     required this.clef,
  //     required this.testType,
  //     required this.svgSource})
  //     : super(key: key) {}

  TestPractisePage.treble({
    Key? key,
  })  : clef = Clef.Treble,
        testType = "Скрипичный ключ",
        svgSource = "assets/images/Skripichniy.svg",
        super(key: key);

  TestPractisePage.bass({
    Key? key,
  })  : clef = Clef.Bass,
        testType = "Басовый ключ",
        svgSource = "assets/images/Basoviy.svg",
        super(key: key);

  TestPractisePage.alto({
    Key? key,
  })  : clef = Clef.Alto,
        testType = "Альтовый ключ",
        svgSource = "assets/images/Altoviy.svg",
        super(key: key);

  @override
  TestPractisePageState createState() => TestPractisePageState(
      clef: this.clef, testType: this.testType, svgSource: this.svgSource);
}

class TestPractisePageState extends State<TestPractisePage> {
  TestPractisePageState(
      {Key? key,
      required this.clef,
      required this.testType,
      required this.svgSource});

  late NoteTestRunner runner;
  late NoteRange keyboardRange;

  String _testTitle = "";
  bool isInit = false;
  final Clef clef;
  final String svgSource;
  final String testType;

  @override
  void didChangeDependencies() {
//
//     var noteInterval = ModalRoute.of(context)?.settings.arguments as ;
//     var noteInterval = NoteRange(
//         NotePosition(note: Note.C), NotePosition(note: Note.C, octave: 5));
    if (isInit == false) {
      isInit = true;
      var args = ModalRoute.of(context)?.settings.arguments as List;
      keyboardRange = args[0] as NoteRange;
      _testTitle = args[1] as String;

      runner = NoteTestRunner(10,
          onGenerateNote: () => setState(() {}),
          onTick: () => setState(() {}),
          onTimeEnd: _onEnd,
          noteInterval: keyboardRange);
    }
  }

  void _onEnd() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Вы ответили на ${runner.userAnswer.length} заданий. Правильно ${runner.score} раз"),
    ));

    Provider.of<StatisticData>(context, listen: false).addFromScreen(
        this.testType,
        SvgPicture.asset(this.svgSource),
        runner.score,
        runner.userAnswer.length - runner.score);
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    // NoteRange(
    //     NotePosition(
    //       note: Note.C, octave: 4, ),
    //     NotePosition(note: Note.C, octave: 6, ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${this._testTitle}"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(this.testType,
                style: Theme.of(context).textTheme.headline3),
          ),
          SizedBox(height: 70),
          ClefImage(
              // noteRangeToClip: keyboardRange,
              clef: this.clef,
              noteRange: NoteRange.forClefs([this.clef]),
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
              size: Size(MediaQuery.of(context).size.width, 150)),
          Text(runner.time.toString()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
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
              // hideNoteNames: true,
              highlightedNotes: [],
              naturalColor: Colors.white,
              accidentalColor: Colors.black,
              keyWidth: 40,
              noteRange: keyboardRange,
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

//TODO
  void playNote(NotePosition note) {}

  @override
  void dispose() {
    runner.End();
    super.dispose();
  }
}
