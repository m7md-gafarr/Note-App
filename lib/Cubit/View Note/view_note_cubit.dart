import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/const/const.dart';
import 'package:note_taking_app/model/NoteModel.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
  List<Notemodel>? list;
  ViewNote() {
    Box<Notemodel> box = Hive.box<Notemodel>(hiveBox);
    list = box.values.toList();
    emit(ViewNoteSuccess());
  }
}
