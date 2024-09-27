import 'package:get_storage/get_storage.dart';
import '../models/note.dart';

class NoteService {
  final box = GetStorage();

  void saveNote(Note note) {
    List<Note> notes = getNotes();
    notes.add(note);
    box.write('notes', notes.map((n) => n.toJson()).toList());
  }

  List<Note> getNotes() {
    final storedNotes = box.read<List>('notes') ?? [];
    return storedNotes.map((note) => Note.fromJson(note)).toList();
  }

  void updateNote(String id, Note note) {
    List<Note> notes = getNotes();
    int index = notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      notes[index] = note;
      box.write('notes', notes.map((n) => n.toJson()).toList());
    }
  }

  void deleteNote(String id) {
    List<Note> notes = getNotes();
    notes.removeWhere((n) => n.id == id);
    box.write('notes', notes.map((n) => n.toJson()).toList());
  }
}
