import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/Cubit/View%20Note/view_note_cubit.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';

class DeleteNotePage extends StatelessWidget {
  DeleteNotePage({super.key, this.index});
  int? index;
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
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  SvgPicture.asset("assets/image/delet.svg",
                      height: MediaQuery.of(context).size.width - 110),
                  const Spacer(flex: 1),
                  const Text(
                    "You sure\nabout this ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "font1",
                      fontSize: 40,
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    "If you delete this note, threat not, you can still find it in the bin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color1,
                      fontFamily: "font2",
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(flex: 2),
                  ElevatedButton(
                      onPressed: () async {
                        await Hive.box<Notemodel>(hiveBox).deleteAt(index!);
                        BlocProvider.of<ViewNoteCubit>(context).ViewNote();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 60),
                        backgroundColor: const Color(0xffffe3e3),
                        elevation: 0,
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text(
                        "Delete this note",
                        style: TextStyle(
                          fontFamily: "font2",
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      )),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
