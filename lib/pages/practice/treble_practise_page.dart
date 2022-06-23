import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:piano/piano.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
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
  TestPractisePageState createState() => TestPractisePageState(clef: this.clef, testType: this.testType, svgSource: this.svgSource);
}

class TestPractisePageState extends State<TestPractisePage> {
  TestPractisePageState({Key? key, required this.clef, required this.testType, required this.svgSource});

  late NoteTestRunner runner;
  late NoteRange keyboardRange;
  final _flutterMidi = FlutterMidi();
  bool _soundModeToggled = false;
  String _testTitle = "";
  bool isInit = false;
  final Clef clef;
  final String svgSource;
  final String testType;

  @override
  void didChangeDependencies() {
    if (!kIsWeb) {
      load(_value);
    } else {
      _flutterMidi.prepare(sf2: null);
    }
    if (isInit == false) {
      isInit = true;
      var args = ModalRoute.of(context)?.settings.arguments as List;
      keyboardRange = args[0] as NoteRange;
      _testTitle = args[1] as String;

      runner = NoteTestRunner(
        10,
        onGenerateNote: () => setState(() {}),
        onTick: () => setState(() {}),
        onTimeEnd: _onEnd,
        noteInterval: keyboardRange,
      );
    }

    _soundModeToggled = settingBox.get('setting_sound') ?? false;
  }

  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);

    _flutterMidi.prepare(sf2: _byte, name: _value.replaceAll('assets/', ''));
  }

  final String _value = 'assets/Piano.sf2';

  void _onEnd() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Вы ответили на ${runner.userAnswer.length} заданий. Правильно ${runner.score} раз"),
    ));

    Provider.of<StatisticData>(context, listen: false).addFromScreen(
      testType,
      getLevel(_testTitle),
      runner.score,
      runner.userAnswer.length - runner.score,
    );
  }

  int getLevel(String val) {
    switch (val) {
      case 'Уровень 1':
        return 1;
      case 'Уровень 2':
        return 2;
      case 'Уровень 3':
        return 3;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_testTitle),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(this.testType, style: Theme.of(context).textTheme.headline4),
          ),
          const SizedBox(height: 70),
          ClefImage(
            clef: clef,
            noteRange: NoteRange.forClefs([clef], extended: true),
            noteImages: (runner.currentNote == null) ? [] : [NoteImage(notePosition: runner.currentNote!)],
            clefColor: Theme.of(context).primaryColor,
            noteColor: Theme.of(context).primaryColor,
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * (testType == 'Скрипичный ключ' ? 0.21 : 0.28)),
          ),
          Text(runner.time.toString()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.indigo, fixedSize: Size(90, 40)),
            onPressed: () => runner.start_test(),
            child: const Text("НАЧАТЬ"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
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
                _play(position.pitch);
                // Use an audio library like flutter_midi to play the sound
              },
            ),
          ),
        ]),
      ),
    );
  }

  void _play(int midi) {
    if (_soundModeToggled) {
      _flutterMidi.playMidiNote(midi: midi);
    }
  }

  @override
  void dispose() {
    runner.End();
    super.dispose();
  }
}
