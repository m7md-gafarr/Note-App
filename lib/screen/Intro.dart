import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/const/const.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                SvgPicture.asset("assets/image/intro.svg",
                    height: MediaQuery.of(context).size.width - 110),
                const Spacer(flex: 1),
                const Text(
                  "All thoughts.\nOne place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "font1",
                    fontSize: 40,
                  ),
                ),
                const Spacer(flex: 1),
                const Text(
                  "Dive right in and clear that mind of yours by writing your thoughts down.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color1,
                    fontFamily: "font2",
                    fontSize: 17,
                  ),
                ),
                const Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "home");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 80),
                    backgroundColor: Colors.black,
                  ),
                  child: const Icon(
                    Iconsax.arrow_right_3,
                    color: Colors.white,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
