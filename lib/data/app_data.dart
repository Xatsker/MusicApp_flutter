import 'package:flutter/material.dart';

class Post {
  static final posts = [
    Post(Colors.amberAccent, 'Скрипичный ключ', 1),
    Post(Colors.blue, 'Басовый ключ', 2),
    Post(Colors.pinkAccent, 'Скрипичный и Басовый', 3),
    Post(Colors.pinkAccent, 'Альтовый и Теноровый', 4),
  ];
  final Color color;
  final String title;
  final int id;

  Post(this.color, this.title, this.id);
}