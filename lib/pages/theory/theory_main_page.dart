import 'package:flutter/material.dart';
import 'package:music_app/data/theory_data.dart';
import 'package:music_app/pages/theory/theory_categories_page.dart';
import 'package:music_app/pages/theory/theory_posts.dart';

import '../../widgets/modifiedTitleText.dart';

class TheoryPage extends StatelessWidget {
  TheoryPage({Key? key}) : super(key: key);
  final theoryData = TheoryData.theoryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Теория"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            //height: MediaQuery.of(context).size.height * 0.15,
            child: ModifiedTitleText('Theory'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: theoryData.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 33.0, left: 10, right: 10),
                    child: _buildElevatedButton(context, theoryData[index].title, theoryData[index].id),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title, int argumentId) {
    return ElevatedButton(
      onPressed: () {
        /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TheoryPosts(postId: 0))
              );*/
        Navigator.of(context).pushNamed(TheoryCategoriesPage.route, arguments: argumentId);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "Roboto",
          letterSpacing: 1.5,
        ),
      ),
      // style: ElevatedButton.styleFrom(fixedSize: const Size(328, 50), primary: Theme.of(context).primaryColor),
    );
  }
}
