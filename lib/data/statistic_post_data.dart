import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/models/statistic_post_model.dart';
import 'package:music_app/models/theory_post_model.dart';

class StatisticData extends ChangeNotifier {
  static final statistics = [
    Statistic('Скрипичный ключ', 1,
        SvgPicture.asset("assets/images/Skripichniy.svg"), 1, 1),
    Statistic(
        'Басовый ключ', 2, SvgPicture.asset("assets/images/Basoviy.svg"), 2, 2),
    Statistic(
        'Ключ До', 3, SvgPicture.asset("assets/images/Altoviy.svg"), 3, 3),
  ];

  List<Statistic> _results = [];

  List<Statistic> get results => List.from(_results);

  StatisticData() {
    //load data from file
  }

  void addFromScreen(
      String title, SvgPicture svg, int rightAnswer, int wrongAnswer) {
    var s = Statistic(title, _results.length + 1, svg, rightAnswer, wrongAnswer);
    addResult(s);
  }

  void addResult(Statistic data) {
    _results.add(data);

    //save to file
    notifyListeners();
  }

  void clear() {
    _results.clear();
    //clear file
    notifyListeners();
  }
}
