import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  AvatarWidget(
      {super.key,
      required this.onTap,
      required this.path,
      required this.select});
  String path;
  bool select;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
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
}
