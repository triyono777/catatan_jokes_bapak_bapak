import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final Function onDelete;
  final Function onEdit;
  NoteWidget(
      {required this.note, required this.onDelete, required this.onEdit});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.title),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        onDelete();
      },
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
        onLongPress: () => onEdit(),
      ),
    );
  }
}
