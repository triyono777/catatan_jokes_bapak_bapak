import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Catatan')),
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
                final note = Note(
                  title: titleController.text,
                  content: contentController.text,
                );
                Provider.of<NoteProvider>(context, listen: false).addNote(note);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
