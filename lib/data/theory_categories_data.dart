import 'package:music_app/models/theory_category.dart';

class TheoryCategoriesData {
  static final List<TheoryCategory> categories = [
    TheoryCategory(1, 1, "От Автора", '/from_author'),
    TheoryCategory(2, 1, "Звуки, Звукоряд", '/sounds'),
    TheoryCategory(2, 2, "Октавы", '/octaves'),
    TheoryCategory(2, 3, "Тона", '/tones'),
    TheoryCategory(3, 1, "Ноты", '/notes'),
    TheoryCategory(3, 2, "Длительности", '/durations'),
    TheoryCategory(3, 3, "Метроном", '/metronome'),
    TheoryCategory(4, 1, "Общие Сведения", '/about_keys'),
    TheoryCategory(4, 2, "Скрипичный Ключ", '/treble_key'),
    TheoryCategory(4, 3, "Басовый Ключ", '/bass_key'),
    TheoryCategory(4, 4, "Альтовый Ключ", '/alto_key'),
  ];
}