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

  void deleteNote(int index) {
    List<Note> notes = getNotes();
    notes.removeAt(index);
    box.write('notes', notes.map((n) => n.toJson()).toList());
  }
}
