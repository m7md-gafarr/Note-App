import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_taking_app/Cubit/Add%20Note/add_note_cubit.dart';
import 'package:note_taking_app/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';
import 'package:note_taking_app/screen/AddAndEditNote.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:note_taking_app/screen/Intro.dart';
import 'package:note_taking_app/screen/deletNote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Notemodel>(hiveBox);
  Hive.registerAdapter(NotemodelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          "intro": (context) => const IntroPage(),
          "home": (context) => const HomePage(),
          "note": (context) => const AddAndEditNotePage(),
          "delete": (context) => const DeleteNotePage()
        },
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}
