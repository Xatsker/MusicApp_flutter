import 'package:flutter/material.dart';

class Methronome extends StatelessWidget {
  static const route = '/metronome';

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