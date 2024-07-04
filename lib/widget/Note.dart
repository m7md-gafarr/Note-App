import 'package:flutter/material.dart';
import 'package:note_taking_app/model/NoteModel.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({super.key, required this.model, required this.onTap});
  final Notemodel model;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(model.color),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  model.Title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "font2",
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              const Align(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  softWrap: true,
                  model.SubTitle,
                  style: const TextStyle(
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
    );
  }
}
