import 'package:flutter/material.dart';

class Octaves extends StatelessWidget {
  static const route = '/octaves';

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