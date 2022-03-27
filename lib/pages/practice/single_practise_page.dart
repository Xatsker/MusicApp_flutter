import 'package:flutter/material.dart';

class SinglePractisePage extends StatelessWidget {
  const SinglePractisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Уровень 1"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
    );
  }
}