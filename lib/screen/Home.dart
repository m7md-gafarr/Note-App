import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/widget/history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              actions: [
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
          ],
          body: Padding(
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
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                    itemBuilder: (context, index) => Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffb0e9ca),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "The lost song",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "font2",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
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
                                  thickness: .6,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "I had a plan, but never finished it, and I've been searching for the thought and I've been searching in a haze the  and I've been searching in a haze bbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                                style: TextStyle(
                                  fontFamily: "font2",
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "note");
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
