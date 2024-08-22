import 'package:hive/hive.dart';

class HiveNotesMethod {
  final Box<String> notesBox = Hive.box<String>('notesBox');

  createNote(String note) {
    notesBox.add(note);
  }

  List<String> getNotes() {
    return notesBox.values.toList();
  }

  updateNote(int index, String updatedNote) {
    notesBox.putAt(index, updatedNote);
  }

  deleteNote(int index) {
    notesBox.deleteAt(index);
  }
}
