import 'package:flutter/material.dart';
import 'package:music_app/data/theory_categories_data.dart';
import 'package:music_app/pages/navbar.dart';
import 'package:music_app/widgets/post_tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../widgets/modifiedTitleText.dart';

class TheoryCategoriesPage extends StatelessWidget {
  TheoryCategoriesPage({Key? key}) : super(key: key);
  static const route = '/theory-categories';
  final categoryData = TheoryCategoriesData.categories;

  @override
  Widget build(BuildContext context) {
    final argumentId = ModalRoute.of(context)!.settings.arguments;
    final navbar = Provider.of<NavbarProvider>(context);
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
                          tileColor: Colors.indigo,
                          postTitle: categoryData[index].title.toUpperCase(),
                          onTileTap: () => Navigator.of(context).pushNamed(categoryData[index].pathToPost, arguments: categoryData[index].title));
                    }
                    return Container();
                  }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        currentIndex: navbar.currentIndex,
        onTap: (index) {
          navbar.onTapPage(context, index);
        },
        items: [
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.home,
              size: 25,
            ),
            title: const Text('Главная'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.menu_book_outlined,
              size: 25,
            ),
            title: const Text('Теория'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.handyman,
              size: 25,
            ),
            title: const Text('Практика'),
          ),
          SalomonBottomBarItem(
            selectedColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.stacked_bar_chart,
              size: 25,
            ),
            title: const Text('Статистика'),
          ),
        ],
      ),
    );
  }
}
