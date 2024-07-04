import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_taking_app/Cubit/Add%20Note/add_note_cubit.dart';
import 'package:note_taking_app/Cubit/Edit%20Note/edit_note_cubit.dart';
import 'package:note_taking_app/Cubit/View%20Note/view_note_cubit.dart';

import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';
import 'package:note_taking_app/screen/deletNote.dart';

class EditnotePage extends StatefulWidget {
  EditnotePage(
      {super.key,
      this.title,
      this.subtitle,
      this.color,
      this.Datetime,
      this.index});
  String? title, subtitle;
  var Datetime;
  int? color;
  int? index;
  @override
  State<EditnotePage> createState() => _AddAndEditNotePageState();
}

class _AddAndEditNotePageState extends State<EditnotePage> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(widget.color!),
      appBar: AppBar(
        backgroundColor: Color(widget.color!),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
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
                  onPressed: () {
                    if (fromkey.currentState!.validate()) {
                      fromkey.currentState!.save();

                      BlocProvider.of<EditNoteCubit>(context).EditNote(
                        notemodel: Notemodel(
                            Title: widget.title!,
                            SubTitle: widget.subtitle!,
                            color: widget.color!,
                            DataTime: widget.Datetime),
                        index: widget.index!,
                      );
                      BlocProvider.of<ViewNoteCubit>(context).ViewNote();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(
                        side: BorderSide(color: Colors.black)),
                    fixedSize: const Size(30, 30),
                    backgroundColor: Color(widget.color!),
                  ),
                  child: const Icon(
                    Iconsax.save_2,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeleteNotePage(
                            index: widget.index,
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(
                        side: BorderSide(color: Colors.black)),
                    fixedSize: const Size(30, 30),
                    backgroundColor: Color(widget.color!),
                  ),
                  child: const Icon(
                    Iconsax.note_remove,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state is EditNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: Form(
              key: fromkey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: widget.title,
                        autofocus: true,
                        onSaved: (value) {
                          widget.title = value;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter Title.";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                          fontFamily: "font1",
                          color: Colors.black,
                          fontSize: 40,
                        ),
                        decoration: const InputDecoration(
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
                          widget.Datetime.toString(),
                          style: const TextStyle(
                            fontFamily: "font2",
                            color: color1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TextFormField(
                        initialValue: widget.subtitle,
                        onSaved: (value) {
                          widget.subtitle = value;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter Note Contact.";
                          } else {
                            return null;
                          }
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        style: const TextStyle(
                          fontFamily: "font2",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter note",
                          hintStyle: TextStyle(
                            fontFamily: "font2",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
                            onPressed: () {
                              widget.color = const Color(0xffb0e9ca).value;
                              setState(() {
                                widget.color = const Color(0xffb0e9ca).value;
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffEED3D9),
                            onPressed: () {
                              setState(() {
                                widget.color = const Color(0xffEED3D9).value;
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xff81A263),
                            onPressed: () {
                              setState(() {
                                widget.color = const Color(0xff81A263).value;
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffEEEEEE),
                            onPressed: () {
                              setState(() {
                                widget.color = const Color(0xffEEEEEE).value;
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffB5C0D0),
                            onPressed: () {
                              setState(() {
                                widget.color = const Color(0xffB5C0D0).value;
                              });
                            },
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
            ),
          );
        },
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
