import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class EditNoteScreen extends StatelessWidget {
  final Note note;
  final TextEditingController titleController;
  final TextEditingController contentController;

  EditNoteScreen({required this.note})
      : titleController = TextEditingController(text: note.title),
        contentController = TextEditingController(text: note.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Konten'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = Note(
                  title: titleController.text,
                  content: contentController.text,
                );
                Provider.of<NoteProvider>(context, listen: false).updateNote(
                  note.id,
                  updatedNote,
                );
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Perbarui'),
            ),
          ],
        ),
      ),
    );
  }
}
