import 'package:flutter/material.dart';
import 'package:music_app/data/theory_categories_data.dart';
import 'package:music_app/widgets/post_tile_widget.dart';

import '../../widgets/modifiedTitleText.dart';

class TheoryCategoriesPage extends StatelessWidget {
  TheoryCategoriesPage({Key? key}) : super(key: key);
  static const route = '/theory-categories';
  final categoryData = TheoryCategoriesData.categories;

  @override
  Widget build(BuildContext context) {
    final argumentId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Разделы'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height * 0.15,
            child: ModifiedTitleText('Sections'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                  itemCount: categoryData.length,
                  itemBuilder: (_, index) {
                    if (argumentId == categoryData[index].sectionId) {
                      return PostTile(
                          tileColor: Theme.of(context).primaryColor,
                          postTitle: categoryData[index].title.toUpperCase(),
                          onTileTap: () => Navigator.of(context).pushNamed(
                              categoryData[index].pathToPost,
                              arguments: categoryData[index].title));
                    }
                    return Container();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
