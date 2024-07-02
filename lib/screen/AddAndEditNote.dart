import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/const.dart';

class AddAndEditNotePage extends StatelessWidget {
  const AddAndEditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              fixedSize: const Size(30, 30),
              backgroundColor: Colors.black,
            ),
            child: const Icon(
              Iconsax.arrow_left_2,
              color: Colors.white,
              size: 18,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(side: BorderSide(color: Colors.black)),
              fixedSize: const Size(30, 30),
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Iconsax.save_2,
              color: Colors.black,
              size: 18,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(side: BorderSide(color: Colors.black)),
              fixedSize: const Size(30, 30),
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Iconsax.note_remove,
              color: Colors.black,
              size: 18,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontFamily: "font1",
                  color: Colors.black,
                  fontSize: 40,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title Note",
                  hintStyle: TextStyle(
                    fontFamily: "font1",
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Saturday, 4th of March",
                  style: TextStyle(
                    fontFamily: "font2",
                    color: color1,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                scrollPhysics: NeverScrollableScrollPhysics(),
                style: TextStyle(
                  fontFamily: "font2",
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Content",
                  hintStyle: TextStyle(
                    fontFamily: "font2",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
