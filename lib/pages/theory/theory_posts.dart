import 'package:flutter/material.dart';
import 'package:music_app/data/theory_post_data.dart';

class TheoryPosts extends StatelessWidget {
  final int postId;
  const TheoryPosts({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = TheoryPostData.posts[postId];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(post.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: post.svg,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shadowColor: Colors.indigo,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            post.title,
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              post.content,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: post.image
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
