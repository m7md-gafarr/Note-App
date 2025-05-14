import 'package:hive/hive.dart';
import 'package:note_taking_app/src/data/model/NoteModel.dart';

class HiveService {
  static const String NOTES_BOX = "notes_box";
  late Box<Notemodel> boxNotes;

  HiveService() {
    openBox();
  }

  Future<void> openBox() async {
    try {
      if (!Hive.isBoxOpen(NOTES_BOX)) {
        boxNotes = await Hive.openBox<Notemodel>(NOTES_BOX);
      } else {
        boxNotes = Hive.box<Notemodel>(NOTES_BOX);
      }
    } catch (e) {
      throw Exception("Error opening the Hive box: $e");
    }
  }

  Future<void> addNote(Notemodel model) async {
    try {
      await boxNotes.add(model);
    } catch (e) {
      throw Exception("Error adding note: $e");
    }
  }

  Future<void> deleteNote(int index) async {
    try {
      await boxNotes.deleteAt(index);
    } catch (e) {
      throw Exception("Error deleting note: $e");
    }
  }

  Future<void> deleteAllNotes() async {
    try {
      await boxNotes.clear();
    } catch (e) {
      throw Exception("Error deleting all notes: $e");
    }
  }

  Future<void> updateNote(int index, Notemodel model) async {
    try {
      await boxNotes.putAt(index, model);
    } catch (e) {
      throw Exception("Error updating note: $e");
    }
  }

  Future<Notemodel?> getNote(int index) async {
    try {
      return boxNotes.getAt(index);
    } catch (e) {
      throw Exception("Error getting note: $e");
    }
  }

  Future<List<Notemodel>> getAllNotes() async {
    try {
      return boxNotes.values.toList().cast<Notemodel>();
    } catch (e) {
      throw Exception("Error getting all notes: $e");
    }
  }
}
