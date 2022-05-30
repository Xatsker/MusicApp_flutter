import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/models/screens.dart';
import 'package:music_app/pages/other/developer_page.dart';
import 'package:music_app/pages/other/settings_page.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

   final screenData = Provider.of<Screens>(context);
   var theory = screenData.screens[1];

    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage())
            );
          }, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeveloperPage())
            );
          }, icon: const Icon(Icons.info)),
        ],
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                SvgPicture.asset("assets/images/Skripichniy.svg"),
                const Text('Notogram', style: TextStyle(
                    fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => theory)
              );
            },
            child: const Text('ТЕОРИЯ', style: TextStyle(
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
                  MaterialPageRoute(builder: (context) =>  PracticePage())
              );
            },
            child: const Text('ПРАКТИКА', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: Colors.indigo),
          ),
        ],
      ),
    );
  }
}
