import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_taking_app/Cubit/Add%20Note/add_note_cubit.dart';
import 'package:note_taking_app/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';

class AddAndEditNotePage extends StatefulWidget {
  const AddAndEditNotePage({super.key});

  @override
  State<AddAndEditNotePage> createState() => _AddAndEditNotePageState();
}

class _AddAndEditNotePageState extends State<AddAndEditNotePage> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> fromkey = GlobalKey();
  String? title, subtitle;
  var Datetime = DateFormat('EEEE,MMM d,yyyy').format(DateTime.now());
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
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

                      BlocProvider.of<AddNoteCubit>(context).AddNote(
                        notemodel: Notemodel(
                          Title: title!,
                          SubTitle: subtitle!,
                          color: color.toString(),
                          DataTime: Datetime,
                        ),
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(
                        side: BorderSide(color: Colors.black)),
                    fixedSize: const Size(30, 30),
                    backgroundColor: color,
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
                    shape: const CircleBorder(
                        side: BorderSide(color: Colors.black)),
                    fixedSize: const Size(30, 30),
                    backgroundColor: color,
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
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailear) {
            SnackBar(content: Text(state.e));
          } else if (state is AddNoteSuccess) {
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
                        autofocus: true,
                        onChanged: (value) {
                          title = value;
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
                          Datetime.toString(),
                          style: const TextStyle(
                            fontFamily: "font2",
                            color: color1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          subtitle = value;
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
                              color = const Color(0xffb0e9ca);
                              setState(() {
                                color = const Color(0xffb0e9ca);
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffEED3D9),
                            onPressed: () {
                              setState(() {
                                color = const Color(0xffEED3D9);
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xff81A263),
                            onPressed: () {
                              setState(() {
                                color = const Color(0xff81A263);
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffEEEEEE),
                            onPressed: () {
                              setState(() {
                                color = const Color(0xffEEEEEE);
                              });
                            },
                          ),
                          _Color(
                            color: const Color(0xffB5C0D0),
                            onPressed: () {
                              setState(() {
                                color = const Color(0xffB5C0D0);
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
