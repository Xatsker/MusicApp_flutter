import 'package:flutter/material.dart';
import 'package:music_app/data/app_data.dart';
import 'package:music_app/pages/theory/single_theory_page.dart';
import 'package:music_app/widgets.dart';

class StatisticPage extends StatelessWidget {
  StatisticPage({Key? key}) : super(key: key);
  final posts = Post.posts;
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
            for (int i = 0; i < posts.length; i++)
              PostTile(
                tileColor: posts[i].color,
                postTitle: posts[i].title,
                onTileTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SingleStatisticPage(postId: 1)),
                ),
                ),
          ],
        ),
      ),
    ),
    );
  }
}
