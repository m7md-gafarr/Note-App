import 'package:flutter/material.dart';
import 'package:note_taking_app/src/core/router/route_name.dart';
import 'package:note_taking_app/src/presentation/introducation/view/Introducation_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.introPageScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const IntroductionScreen());

      case AppRoutesName.addNotePageScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const IntroductionScreen());

      case AppRoutesName.deleteNotePageScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const IntroductionScreen());

      case AppRoutesName.editAvatarPageScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const IntroductionScreen());

      case AppRoutesName.homePageScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const IntroductionScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("The Route Not Found"),
            ),
          ),
        );
    }
  }
}
