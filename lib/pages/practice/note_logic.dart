import 'dart:async';
import 'dart:math';
import 'package:piano/piano.dart';

class NoteTestRunner {
  int _score = 0;
  bool _isRun = false;
  NotePosition? _currentNote;
  int _octave = 4;
  int _prevIndex = 0;

  NotePosition? get currentNote => _currentNote;

  final Function onTick;
  final Function onTimeEnd;
  final Function onGenerateNote;
  final NoteRange noteInterval;

  List<NotePosition> _noteGenerated = [];

  List<NotePosition> _noteAnswer = [];

  List<NotePosition> get userAnswer => List.from(_noteAnswer);

  List<NotePosition> get rightAnswer => List.from(_noteGenerated);

  final int _timeForTest;
  int _seconds = 0;
  Timer? _timer;

  int get score => _score;

  int get time => _seconds;

  NoteTestRunner(
    int this._timeForTest, {
    required Function this.onGenerateNote,
    required Function this.onTick,
    required Function this.onTimeEnd,
    required NoteRange this.noteInterval,
  }) : assert(_timeForTest > 0) {
    // this.noteInterval = NoteRange(
    //     NotePosition(note: Note.C), NotePosition(note: Note.C, octave: 5));
  }

  void start_test() {
    var wqe = NoteRange.forClefs([Clef.Bass]);
    if (_isRun) return;
    _score = 0;
    _noteAnswer.clear();
    _noteGenerated.clear();
    _seconds = _timeForTest;
    _isRun = true;
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

    if (!_isRun || _currentNote == null) return;

    _noteAnswer.add(note);
    if (_currentNote == note) _score++;

    _genNextNote();
    onGenerateNote();
  }

  void End() {
    _isRun = false;
    _timer?.cancel();
  }

  void _genNextNote() {
    // _currentNote = (_currentNote == NotePosition.middleC) ? NotePosition(note: Note.D, octave: 4):NotePosition.middleC; //change to random
    var range = noteInterval.naturalPositions;
    int index = Random().nextInt(range.length);

    _currentNote = range[index == _prevIndex ? Random().nextInt(range.length) : index];
    // NotePosition(note: _randomNote());
    _prevIndex = index;
    _noteGenerated.add(_currentNote!);
    //print(range);
    print('currentNote: ' '${_currentNote}');
  }

  Note _randomNote() {
    int pick = Random().nextInt(Note.values.length);
    return Note.values[pick];
  }
}
