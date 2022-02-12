import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
        backgroundColor: const Color.fromRGBO(2, 119, 189, 1),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
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
                SvgPicture.asset("assets/images/Vector.svg"),
                const Text('Notohram', style: TextStyle(
                    fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('ТЕОРИЯ', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: mainColor),
          ),
          const SizedBox(
            height: 33,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('ПРАКТИКА', style: TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.5,
            ),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 50), primary: mainColor),
          ),
        ],
      ),
    );
  }
}
