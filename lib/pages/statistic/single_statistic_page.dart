import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:provider/provider.dart';

class StatisticPosts extends StatelessWidget {
  final int statisticId;
  const StatisticPosts({
    Key? key,
    required this.statisticId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statisticPost = StatisticData.statistics[statisticId - 1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(statisticPost.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: Provider.of<StatisticData>(context).getStatistic(statisticPost.title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(child: Center(child: CircularProgressIndicator()));
              }

              if (snapshot.hasError || snapshot.data == null) {
                return const Center(child: Text('Произошла ошибка'));
              }

              if (snapshot.data?.docs.isEmpty ?? false) {
                return const Expanded(
                    child: Center(
                  child: Text('У вас нет данных'),
                ));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (_, index) {
                    Map item = snapshot.data!.docs.reversed.toList()[index].data() as Map<String, dynamic>;
                    return SafeArea(
                      child: Card(
                        color: Theme.of(context).cardColor,
                        shadowColor: Colors.indigo,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text("Попытка: ${snapshot.data!.docs.reversed.length - index}", style: const TextStyle(fontSize: 16)),
                            Text("Уровень: ${item['level']}", style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 10),
                            Text("Правильныe ответы: ${item['rightAnswers']}", style: const TextStyle(fontSize: 16)),
                            Text("Неправильные ответы:${item['wrongAnswers']}", style: const TextStyle(fontSize: 16))
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
