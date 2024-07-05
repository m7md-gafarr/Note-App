import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/AvatarModel.dart';
import 'package:note_taking_app/screen/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  oneTimeIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("seen", 0);
  }

  final List<Avatarmodel> avatarlist = [
    Avatarmodel(Path: "assets/image/avatar/Number=6.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=9.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=15.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=27.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=31.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=39.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=50.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=54.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=55.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=64.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=72.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=74.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=75.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=83.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=87.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=103.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=105.png", false),
    Avatarmodel(Path: "assets/image/avatar/Number=112.png", false),
  ];

  final _controller = PageController(viewportFraction: 0.99);
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
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
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                        );
                        // oneTimeIntro();
                        // Navigator.pushNamed(context, "home");
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
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "choose your avatar",
                    style: TextStyle(
                      fontFamily: "font1",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 60,
                  runSpacing: 30,
                  children: [
                    for (var i in avatarlist)
                      avatar(
                        path: i.Path,
                        select: i.select,
                        onTap: () {
                          setState(() {
                            for (var i in avatarlist) {
                              i.select = false;
                            }
                            i.select = !i.select;
                            path = i.Path;
                          });
                        },
                      ),
                  ],
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      oneTimeIntro();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            path: path,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 60),
                      backgroundColor: Colors.black,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Get Start",
                      style: TextStyle(
                        fontFamily: "font2",
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget avatar(
    {required String path,
    required bool select,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        border: Border.all(
          color: select ? Colors.green : Colors.transparent,
          width: 4,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        image: DecorationImage(
          image: AssetImage(path),
        ),
      ),
    ),
  );
}
