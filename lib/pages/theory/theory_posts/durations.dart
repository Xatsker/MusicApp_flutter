import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/firebase_theory_post_model.dart';

class Durations extends StatefulWidget {
  static const route = '/durations';

  @override
  State<Durations> createState() => _DurationsState();
}

class _DurationsState extends State<Durations> {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: FutureBuilder<FirebasePostContent?>(
        future: readPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something go wrong ${snapshot.error}');
          }
          else if (snapshot.hasData) {
            final post = snapshot.data;
            return post == null
                ? const Center(child: Text('No post'))
                : buildPost(post);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildPost(FirebasePostContent firepost) {
    return Card(
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            Text(firepost.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text('id: ${firepost.id}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24),
            Text(firepost.text),
            Text(firepost.imagePath)
          ],
        ),
      ),
    );
  }

  Future<FirebasePostContent?> readPost() async {
    //Get single document by ID
    final docUser =
    FirebaseFirestore.instance.collection('/content').doc('durations');
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return FirebasePostContent.fromJson(snapshot.data()!);
    }
  }
}
