// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/statistic_post_model.dart';

class StatisticData extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static final statistics = [
    Statistic('Скрипичный ключ', 1, SvgPicture.asset("assets/images/Skripichniy.svg"), 1, 1),
    Statistic('Басовый ключ', 2, SvgPicture.asset("assets/images/Basoviy.svg"), 2, 2),
    Statistic('Ключ До', 3, SvgPicture.asset("assets/images/Altoviy.svg"), 3, 3),
  ];

  void addFromScreen(String title, int level, int rightAnswer, int wrongAnswer) async {
    String? _id = await getId();
    Map<String, dynamic> data = {
      'user_id': _id,
      'level': level,
      'type': title == 'Альтовый ключ' ? 'Ключ До' : title,
      'rightAnswers': rightAnswer,
      'wrongAnswers': wrongAnswer,
    };

    await sendToDB(data);
  }

  Future<void> sendToDB(Map<String, dynamic> data) async {
    String time = DateTime.now().toIso8601String();

    try {
      await _db.collection('statistics').doc(time).set(data);
    } catch (e) {
      print(e);
    }
  }

  Future<QuerySnapshot> getStatistic(String type) async {
    String? _id = await getId();

    return await _db.collection('statistics').where('user_id', isEqualTo: _id).where('type', isEqualTo: type).get();
  }

  Future<String?> getId() async {
    return await settingBox.get('ID');
  }
}
