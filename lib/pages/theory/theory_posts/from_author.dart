import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/firebase_theory_post_model.dart';

class FromAuthor extends StatefulWidget {
  static const route = '/from_author';

  @override
  State<FromAuthor> createState() => _FromAuthorState();
}

class _FromAuthorState extends State<FromAuthor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FirebasePostContent?>(
        future: readPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something go wrong ${snapshot.error}');
          } else if (snapshot.hasData) {
            final post = snapshot.data;
            return post == null
                ? const Center(child: Text('No post'))
                : buildPost(post);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
    );
  }

  Widget buildPost(FirebasePostContent firepost) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  firepost.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  firepost.text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SvgPicture.asset(firepost.imagePath)
            ],
          ),
        ),
      ),
    );
  }

  Future<FirebasePostContent?> readPost() async {
    //Get single document by ID
    final docUser =
        FirebaseFirestore.instance.collection('/content').doc('from_author');
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return FirebasePostContent.fromJson(snapshot.data()!);
    }
  }
}