import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_app/Cubit/Edit%20Avatar/edit_avatar_cubit.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:note_taking_app/widget/avatar.dart';
import 'package:note_taking_app/widget/selectAvatar.dart';

class EditavatarPage extends StatefulWidget {
  const EditavatarPage({super.key});

  @override
  State<EditavatarPage> createState() => _EditavatarPageState();
}

class _EditavatarPageState extends State<EditavatarPage> {
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SelectAvatarWidget(
          txt1: "Edit",
          txt2: "Save Edit",
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<EditAvatarCubit>(context).EditAvatarFun();
          },
          widget: [
            for (var i in avatarlist)
              AvatarWidget(
                path: i.Path,
                select: i.select,
                onTap: () {
                  setState(() {
                    for (var i in avatarlist) {
                      i.select = false;
                    }
                    i.select = !i.select;
                    path = i.Path;
                    BlocProvider.of<EditAvatarCubit>(context).path = i.Path;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
