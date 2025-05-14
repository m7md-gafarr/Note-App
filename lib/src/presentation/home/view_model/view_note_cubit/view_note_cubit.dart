import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_app/src/data/model/NoteModel.dart';
import 'package:note_taking_app/src/data/repositories/local/hive.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
  List<Notemodel>? list;
  ViewNote() {
    Box<Notemodel> box = Hive.box<Notemodel>(HiveService.NOTES_BOX);
    list = box.values.toList();
    emit(ViewNoteSuccess());
  }
}
