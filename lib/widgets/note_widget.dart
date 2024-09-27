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
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Pilih Aksi'),
              actions: [
                TextButton(
                  onPressed: () {
                    onEdit();
                    // Navigator.of(context).pop();
                  },
                  child: Text('Edit'),
                ),
                TextButton(
                  onPressed: () {
                    onDelete();
                    // Navigator.of(context).pop();
                  },
                  child: Text('Hapus'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Batal'),
                ),
              ],
            );
          },
        );
      },
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
      ),
    );
  }
}
