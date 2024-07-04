import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/Cubit/View%20Note/view_note_cubit.dart';
import 'package:note_taking_app/model/NoteModel.dart';
import 'package:note_taking_app/screen/EditNote.dart';
import 'package:note_taking_app/widget/Note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Notemodel? model;
  @override
  void initState() {
    BlocProvider.of<ViewNoteCubit>(context).ViewNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: 120,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "3''-Note",
                      style: TextStyle(
                        fontFamily: "font1",
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 100,
                      child: Divider(
                        color: Colors.black,
                        height: 10,
                        thickness: 1.8,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 75,
                      child: Divider(
                        color: Colors.black,
                        height: 10,
                        thickness: 1.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 50,
                      child: Divider(
                        color: Colors.black,
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/image/avatar.png")),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     HistoryWidget(),
              //     HistoryWidget(),
              //     HistoryWidget(),
              //     HistoryWidget(),
              //     HistoryWidget(),
              //   ],
              // ),
              Expanded(
                child: BlocConsumer<ViewNoteCubit, ViewNoteState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    List<Notemodel> list =
                        BlocProvider.of<ViewNoteCubit>(context).list!;
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        pattern: [
                          const WovenGridTile(1),
                          const WovenGridTile(
                            5 / 7,
                            crossAxisRatio: .9,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                        ],
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) => NoteWidget(
                        model: list[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditnotePage(
                                  title: list[index].Title,
                                  subtitle: list[index].SubTitle,
                                  Datetime: list[index].DataTime,
                                  color: list[index].color,
                                  index: index,
                                ),
                              ));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "add");
        },
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(
          Iconsax.note_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
