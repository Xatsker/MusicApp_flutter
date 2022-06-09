import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'firebase_main.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  static const route = '/user-page';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: decoration('Name'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerAge,
            decoration: decoration('Age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          DateTimeField(
            controller: controllerDay,
            decoration: decoration('Birthday'),
            format: DateFormat('yyyy-MM-dd'),
            onShowPicker: (context, currentValue) => showDatePicker(
                context: context,
                initialDate: currentValue ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100)),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final user = User(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                birthday: DateTime.parse(controllerDay.text),
              );
              createUser(user);
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

  Future createUser(User user) async{
    final docUser = FirebaseFirestore.instance.collection('/users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}
