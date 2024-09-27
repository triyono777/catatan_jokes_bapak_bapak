import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/note_service.dart';

class NoteProvider with ChangeNotifier {
  final NoteService _noteService = NoteService();
  List<Note> _notes = [];
  List<Note> get notes => _notes;
  void loadNotes() {
    _notes = _noteService.getNotes();
    notifyListeners();
  }

  void addNote(Note note) {
    _noteService.saveNote(note);
    loadNotes();
  }

  void deleteNote(int index) {
    _noteService.deleteNote(index);
    loadNotes();
  }
}
