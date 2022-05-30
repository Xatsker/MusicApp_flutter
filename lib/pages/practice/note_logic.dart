import 'dart:async';
import 'dart:math';
import 'package:piano/piano.dart';

class NoteTestRunner {
  int _score = 0;
  bool isRun = false;
  NotePosition? _currentNote;

  NotePosition? get currentNote => _currentNote;

  Function onTick;
  Function onTimeEnd;
  Function onGenerateNote;

  List<NotePosition> _noteGenerated = [];

  List<NotePosition> _noteAnswer = [];

  List<NotePosition> get userAnswer => List.from(_noteAnswer);

  List<NotePosition> get rightAnswer => List.from(_noteGenerated);

  final int _timeForTest;
  int _seconds = 0;
  Timer? _timer;

  int get score => _score;

  int get time => _seconds;

  NoteTestRunner(int this._timeForTest,
      {required Function this.onGenerateNote,
        required Function this.onTick,
        required Function this.onTimeEnd})
      : assert(_timeForTest > 0);



  void start_test() {
    if (isRun) return;
      _score = 0;
      _noteAnswer.clear();
      _noteGenerated.clear();
    _seconds = _timeForTest;
    isRun = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick();
      _seconds--;
      if (_seconds == 0) {
        End();
        onTimeEnd();
      }
    });

    _genNextNote();
    onGenerateNote();
  }

  void checkAnswer(NotePosition note) {
    print(note.toString());

    if (!isRun || _currentNote == null) return;

    _noteAnswer.add(note);
    if (_currentNote == note) _score++;

    _genNextNote();
    onGenerateNote();
  }

  void End() {
    isRun = false;
    _timer?.cancel();
  }

  void _genNextNote() {
    // _currentNote = (_currentNote == NotePosition.middleC) ? NotePosition(note: Note.D, octave: 4):NotePosition.middleC; //change to random
    _currentNote = NotePosition(note: _randomNote());

    _noteGenerated.add(_currentNote!);
  }

  Note _randomNote() {
    int pick = Random().nextInt(Note.values.length);
    return Note.values[pick];
  }
}