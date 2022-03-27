import 'package:flutter/material.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:music_app/pages/theory/theory_page.dart';

class Post {
  static final posts = [
    Post(Colors.amberAccent, 'Скрипичный ключ', 1,
        'Скрипичный ключ (соль) — это знак линейной нотации, который пишется на нотном стане, начиная со второй линии. Он показывает, что именно эта линия получает значение ключа. То есть «соль» первой октавы.'),
    Post(Colors.blue, 'Басовый ключ', 2,
        'Басовый ключ (фа) — это знак линейной нотации, который пишется на четвертой линии нотоносца. Предназначен для низкого звучания.'),
    Post(Colors.pinkAccent, 'Ключ До', 3,
        'Кроме общераспространенных скрипичного и басового ключей, существует менее употребительный в наше время ключ «До». Ему следует уделить отдельное внимание, так как он имеет особую форму применения. Используется для обозначения ноты «До» первой октавы. В нотном стане ключ «До» закрепляется следующим образом.'),
    Post(Colors.pinkAccent, 'Теноровый', 4,
        'Кроме общераспространенных скрипичного и басового ключей, существует менее употребительный в наше время ключ «До». Ему следует уделить отдельное внимание, так как он имеет особую форму применения. Используется для обозначения ноты «До» первой октавы. В нотном стане ключ «До» закрепляется следующим образом.'),
  ];
  final Color color;
  final String title;
  final int id;
  final String content;

  Post(this.color, this.title, this.id, this.content);
}