import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

part 'statistic_post_model.g.dart';

@HiveType(typeId: 0)
class Statistic {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final SvgPicture svg;

  @HiveField(3)
  final int rightAnswer;

  @HiveField(4)
  final int wrongAnswer;

  Statistic(this.title, this.id, this.svg, this.rightAnswer, this.wrongAnswer);
}