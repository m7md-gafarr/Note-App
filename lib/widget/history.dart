import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const Column(
        children: [
          Spacer(flex: 2),
          Text(
            "Sun",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            "15",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Text(
            "Sep",
            style: TextStyle(
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

Widget _widget() {
  return Container(
    height: 100,
    width: 60,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      border: Border.all(width: 2, color: Colors.black),
    ),
    child: const Column(
      children: [
        Spacer(flex: 2),
        Text(
          "Sun",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Text(
          "15",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        Text(
          "Sep",
          style: TextStyle(
            fontFamily: "font2",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Spacer(flex: 2),
      ],
    ),
  );
}
