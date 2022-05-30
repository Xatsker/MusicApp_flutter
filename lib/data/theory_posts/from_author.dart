import 'package:flutter/material.dart';

class FromAuthor extends StatelessWidget {
  static const route = '/from_author';

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}
