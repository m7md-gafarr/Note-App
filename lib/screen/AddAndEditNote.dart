import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
            onPressed: () {
              Navigator.pushNamed(context, "delete");
            },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const TextField(
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
              const Align(
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
              const TextField(
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
                  hintText: "Enter note",
                  hintStyle: TextStyle(
                    fontFamily: "font2",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 10,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Color(
                    color: const Color(0xffb0e9ca),
                    onPressed: () {},
                  ),
                  _Color(
                    color: const Color(0xffEED3D9),
                    onPressed: () {},
                  ),
                  _Color(
                    color: const Color(0xff81A263),
                    onPressed: () {},
                  ),
                  _Color(
                    color: const Color(0xffEEEEEE),
                    onPressed: () {},
                  ),
                  _Color(
                    color: const Color(0xffB5C0D0),
                    onPressed: () {},
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                height: 10,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _Color({required Color color, required void Function() onPressed}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(30, 30),
        backgroundColor: color,
      ),
      child: const Text(""));
}
