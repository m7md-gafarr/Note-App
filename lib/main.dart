import 'package:flutter/material.dart';
import 'package:note_taking_app/screen/AddAndEditNote.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:note_taking_app/screen/Intro.dart';

void main() {
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
      },
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
