import 'package:flutter/material.dart';

class TheoryPage extends StatelessWidget {
  const TheoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Теория"),
        backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text('Theory', style: TextStyle(
                    fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('ВВЕДЕНИЕ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.deepPurple),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('СКРИПИЧНЫЙ КЛЮЧ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.deepPurple),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('БАСОВЫЙ КЛЮЧ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.deepPurple),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('АЛЬТОВЫЙ И ТЕНОРОВЫЙ КЛЮЧИ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
