import 'package:flutter/material.dart';

class SelectAvatarWidget extends StatelessWidget {
  SelectAvatarWidget(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.txt1,
      required this.txt2});
  List<Widget> widget;
  void Function()? onPressed;
  String txt1, txt2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "$txt1 your avatar",
            style: const TextStyle(
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
            children: widget),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.maxFinite, 60),
              backgroundColor: Colors.black,
              elevation: 0,
            ),
            child: Text(
              txt2,
              style: const TextStyle(
                fontFamily: "font2",
                color: Colors.white,
                fontSize: 21,
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
