import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:provider/provider.dart';

import '../../models/statistic_post_model.dart';

class StatisticPosts extends StatelessWidget {
  final int statisticId;
  const StatisticPosts({
    Key? key,
    required this.statisticId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statisticPost = StatisticData.statistics[statisticId - 1];
    final listResult = Provider.of<StatisticData>(context).results.where((element) => element.title == statisticPost.title).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(statisticPost.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body:
      ValueListenableBuilder<Box<Statistic>>(
        valueListenable: Hive.box<Statistic>("statistic").listenable(),
        builder: (ctx, box, _) {
          return ListView.builder(
            itemCount: listResult.length,
            itemBuilder: (_,index) {
              Statistic currentStatistic = listResult[index];
              currentStatistic = box.getAt(index)!;
              return SafeArea(
                  child: Card(
                    shadowColor: Colors.indigo,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: [
                            Text("Попытка: ${index+1}", style: TextStyle(fontSize: 16)),
                            Text("Уровень: 1", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 10),
                            Text("Правильныe ответы: ${currentStatistic.rightAnswer}", style: TextStyle(fontSize: 16)),
                            Text("Неправильные ответы: ${currentStatistic.wrongAnswer}", style: TextStyle(fontSize: 16))
                          ]
                      ),
                    ),
                  ),
                );
            },
          );
        },
      ),
      );
  }
}
