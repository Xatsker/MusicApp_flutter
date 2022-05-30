import 'package:flutter/material.dart';

class AboutKeys extends StatelessWidget {
  static const route = '/about_keys';

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