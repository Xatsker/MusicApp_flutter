import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/firebasetest/user_page.dart';

class FirebaseMain extends StatefulWidget {
  const FirebaseMain({Key? key}) : super(key: key);
  static const route = '/firebase-main';

  @override
  State<FirebaseMain> createState() => _FirebaseMainState();
}

class _FirebaseMainState extends State<FirebaseMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All users'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UserPage.route);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      //READ ONE USER
      body: FutureBuilder<User?>(
        future: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something go wrong ${snapshot.error}');
          }
          else if (snapshot.hasData) {
            final user = snapshot.data;
            return user == null
                ? const Center(child: Text('No User'))
                : buildUser(user);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      //READ ALL USERS
      ////////////////////
      /*body: FutureBuilder<List<User>>(
        future: readUsers().first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something go wrong ${snapshot.error}');
          }
          else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),*/
      ////////////////
    );
  }

  Stream<List<User>> readUsers() {
    return FirebaseFirestore.instance.collection('/users').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  Widget buildUser(User user) {
    return ListTile(
      leading: CircleAvatar(child: Text('${user.age}')),
      title: Text(user.name),
      subtitle: Text(user.birthday.toIso8601String()),
    );
  }

  Future<User?> readUser() async {
    //Get single document by ID
    final docUser =
        FirebaseFirestore.instance.collection('/users').doc('my-id');
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }
}

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate());
  }
}
