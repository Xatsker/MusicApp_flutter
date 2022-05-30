import 'package:flutter/material.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:music_app/pages/statistic/single_statistic_page.dart';
import 'package:music_app/widgets/post_tile_widget.dart';

import '../../models/theory_post_model.dart';

class StatisticPage extends StatelessWidget {
  StatisticPage({Key? key}) : super(key: key);
  final statisticPost = StatisticData.statistics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.indigo,
      title: const Text('Статистика'),
      centerTitle: true,
    ),
    body:  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Statistic', style: TextStyle(
                fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            for (int i = 0; i < statisticPost.length; i++)
              PostTile(
                tileColor: Colors.indigo,
                postTitle: statisticPost[i].title.toUpperCase(),
                onTileTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticPosts(statisticId: i+1)),
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}
