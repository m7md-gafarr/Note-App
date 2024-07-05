import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class Nonote extends StatelessWidget {
  const Nonote({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/animation/note.json",
      ),
    );
  }
}
 // const Spacer(
        //   flex: 10,
        // ),
        // const Row(
        //   children: [
        //     Text(
        //       "Add your first note",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontFamily: "font1",
        //         fontSize: 22,
        //       ),
        //     ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     Icon(Iconsax.arrow_right_1),
        //   ],
        // ),
        // const Spacer(
        //   flex: 1,
        // ),