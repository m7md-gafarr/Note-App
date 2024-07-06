import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_taking_app/Cubit/Add%20Note/add_note_cubit.dart';
import 'package:note_taking_app/Cubit/Edit%20Avatar/edit_avatar_cubit.dart';
import 'package:note_taking_app/Cubit/Edit%20Note/edit_note_cubit.dart';
import 'package:note_taking_app/Cubit/View%20Note/view_note_cubit.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';
import 'package:note_taking_app/screen/AddNote.dart';
import 'package:note_taking_app/screen/EditAvatar.dart';
import 'package:note_taking_app/screen/EditNote.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:note_taking_app/screen/Intro.dart';
import 'package:note_taking_app/screen/deletNote.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? _seen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>(hiveBox);
  SharedPreferences Prefs = await SharedPreferences.getInstance();
  _seen = Prefs.getInt('seen');

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
        BlocProvider(
          create: (context) => ViewNoteCubit(),
        ),
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
        BlocProvider(
          create: (context) => EditAvatarCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          "intro": (context) => const IntroPage(),
          "home": (context) => HomePage(),
          "add": (context) => const AddNotePage(),
          "edit": (context) => EditnotePage(),
          "delete": (context) => DeleteNotePage(),
          "editavatar": (context) => const EditavatarPage()
        },
        debugShowCheckedModeBanner: false,
        initialRoute: _seen != 0 ? "intro" : "home",
        // home: const IntroPage(),
      ),
    );
  }
}
