import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheoryPost {

  final int id;
  final String title;
  final SvgPicture svg;
  final Image image;
  final String content;

  TheoryPost(this.title, this.id, this.svg, this.image, this.content);
}