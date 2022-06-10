import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/firebase_theory_post_model.dart';

class ReadPostWidget extends StatelessWidget {
  String postName;
  ReadPostWidget(this.postName);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<FirebasePostContent?> readPost(postName) async {
    //Get single document by ID
    final docUser =
    FirebaseFirestore.instance.collection('/content').doc(postName);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return FirebasePostContent.fromJson(snapshot.data()!);
    }
  }
}
