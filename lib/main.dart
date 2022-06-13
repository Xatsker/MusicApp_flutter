import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/data/statistic_post_data.dart';
import 'package:music_app/models/screens.dart';
import 'package:music_app/models/statistic_post_model.dart';
import 'package:music_app/pages/firebasetest/firebase_main.dart';
import 'package:music_app/pages/firebasetest/user_page.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/navbar.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:music_app/pages/practice/treble_practise_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:music_app/pages/theory/theory_categories_page.dart';
import 'package:music_app/pages/theory/theory_main_page.dart';
import 'package:music_app/pages/theory/theory_posts/about_keys.dart';
import 'package:music_app/pages/theory/theory_posts/alterations_signs.dart';
import 'package:music_app/pages/theory/theory_posts/from_author.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/theory/theory_posts/alto_key.dart';
import 'pages/theory/theory_posts/bass_key.dart';
import 'pages/theory/theory_posts/durations.dart';
import 'pages/theory/theory_posts/methronome.dart';
import 'pages/theory/theory_posts/notes.dart';
import 'pages/theory/theory_posts/octaves.dart';
import 'pages/theory/theory_posts/sounds.dart';
import 'pages/theory/theory_posts/tones.dart';
import 'pages/theory/theory_posts/treble_key.dart';

late Box box;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter<Statistic>(StatisticAdapter());
  box = await Hive.openBox<Statistic>("statistic");
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => StatisticData()),
              ChangeNotifierProvider(create: (_) => Screens()),
            ],
            child: buildMaterialApp(),
          )));
  }
  class buildMaterialApp extends StatefulWidget {
    const buildMaterialApp({Key? key}) : super(key: key);

    @override
    State<buildMaterialApp> createState() => _buildMaterialAppState();
  }

  class _buildMaterialAppState extends State<buildMaterialApp> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: "ReenieBeanie",
                  fontSize: 70,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          cardColor: Colors.white,
        ),
        darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.indigo,
            primarySwatch: Colors.teal,
          textTheme:
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          cardColor: Colors.teal
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Navbar(),
          '/home': (context) => HomePage(),
          '/theory': (context) => TheoryPage(),
          '/practise': (context) => PracticePage(),
          '/statistic': (context) => StatisticPage(),

          '/treble': (context) => TestPractisePage.treble(),
          '/alt': (context) => TestPractisePage.alto(),
          '/bass': (context) => TestPractisePage.bass(),

          TheoryCategoriesPage.route: (context) => TheoryCategoriesPage(),

          //Theory_post_pages_route
          FromAuthor.route: (context) => FromAuthor(),
          AboutKeys.route: (context) => AboutKeys(),
          AltoKey.route: (context) => AltoKey(),
          BassKey.route: (context) => BassKey(),
          TrebleKey.route: (context) => TrebleKey(),
          Durations.route: (context) => Durations(),
          Methronome.route: (context) => Methronome(),
          Notes.route: (context) => Notes(),
          Octaves.route: (context) => Octaves(),
          Sounds.route: (context) => Sounds(),
          Tones.route: (context) => Tones(),
          AlterationSigns.route: (context) => AlterationSigns(),

          //Firebase_Test
          FirebaseMain.route: (context) => FirebaseMain(),
          UserPage.route: (context) => UserPage()
        },
      );
    }
  }
