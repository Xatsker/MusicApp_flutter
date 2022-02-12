import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
        title: Text("Статистика"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.music_note)),
              ),
              Container(
                color: Colors.green,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.music_note)),
              )
            ],
          )
        ],
      )
    );
  }
}

