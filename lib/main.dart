import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_taking_app/screen/AddAndEditNote.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:note_taking_app/screen/Intro.dart';
import 'package:note_taking_app/screen/deletNote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("NotesBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "intro": (context) => const IntroPage(),
        "home": (context) => const HomePage(),
        "note": (context) => const AddAndEditNotePage(),
        "delete": (context) => const DeleteNotePage()
      },
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
