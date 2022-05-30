import 'package:flutter/material.dart';

class BassKey extends StatelessWidget {
  static const route = '/bass_key';

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