import 'package:music_app/models/theory_category.dart';

class TheoryCategoriesData {
  static final List<TheoryCategory> categories = [
    TheoryCategory(1, 1, "ОТ АВТОРА", '/from_author'),
    TheoryCategory(2, 1, "ЗВУКИ, ЗВУКОРЯД", '/sounds'),
    TheoryCategory(2, 2, "ОКТАВЫ", '/octaves'),
    TheoryCategory(2, 3, "ТОНА", '/tones'),
    TheoryCategory(3, 1, "НОТЫ", '/notes'),
    TheoryCategory(3, 2, "ДЛИТЕЛЬНОСТИ", '/durations'),
    TheoryCategory(3, 3, "МЕТРОНОМ", '/metronome'),
    TheoryCategory(4, 1, "ОБЩИЕ СВЕДЕНИЯ", '/about_keys'),
    TheoryCategory(4, 2, "СКРИПИЧНЫЙ КЛЮЧ", '/treble_key'),
    TheoryCategory(4, 3, "БАСОВЫЙ КЛЮЧ", '/bass_key'),
    TheoryCategory(4, 4, "АЛЬТОВЫЙ КЛЮЧ", '/alto_key'),
  ];
}