import 'package:flutter/material.dart';

class TrebleKey extends StatelessWidget {
  static const route = '/treble_key';

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