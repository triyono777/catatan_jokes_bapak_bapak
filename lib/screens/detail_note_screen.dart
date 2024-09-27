import 'package:flutter/material.dart';
import '../models/note.dart';

class DetailNoteScreen extends StatelessWidget {
  final Note note;

  DetailNoteScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(note.content, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
