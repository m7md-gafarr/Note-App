// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class Notemodel extends HiveObject {
  @HiveField(0)
  final String Title;
  @HiveField(1)
  final String SubTitle;
  @HiveField(2)
  final int color;
  @HiveField(3)
  final String DataTime;
  Notemodel({
    required this.Title,
    required this.SubTitle,
    required this.color,
    required this.DataTime,
  });
}
