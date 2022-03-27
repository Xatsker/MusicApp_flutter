import 'package:flutter/material.dart';
import 'package:music_app/pages/practice/single_practise_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';

class PracticePage extends StatelessWidget {
   PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Практика"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticPage())
            );
          }, icon: Icon(Icons.stacked_bar_chart)),
        ],
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
                const Text('Practice', style: TextStyle(
                    fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('УРОВЕНЬ 1', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.indigo),
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
                fixedSize: const Size(328, 50), primary: Colors.indigo),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SinglePractisePage())
              );
            },
            child: const Text('НАЧАТЬ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(181, 50), primary: Colors.indigoAccent),
          ),
        ],
      ),
    );
  }
}
