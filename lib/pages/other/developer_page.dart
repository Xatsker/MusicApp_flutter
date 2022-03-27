import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("О разработчике"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
    );
  }
}