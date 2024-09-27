import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../providers/joke_provider.dart';
import '../widgets/note_widget.dart';
import '../widgets/joke_widget.dart';
import '../widgets/custom_dialog.dart';
import 'add_note_screen.dart';
import 'detail_note_screen.dart';
import 'edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<JokeProvider>(context, listen: false).loadJoke();
    Provider.of<NoteProvider>(context, listen: false).loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Jokes Bapak Bapak')),
      body: Column(
        children: [
          // Jokes Section
          Expanded(
            flex: 1,
            child:
                jokeProvider.jokeText != null && jokeProvider.jokeImage != null
                    ? JokeWidget(
                        jokeText: jokeProvider.jokeText!,
                        jokeImage: jokeProvider.jokeImage!,
                        onRefresh: () => jokeProvider.refreshJoke(),
                      )
                    : Center(child: CircularProgressIndicator()),
          ),
          // List Catatan
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Catatan Pribadi', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: noteProvider.notes.length,
                    itemBuilder: (context, index) {
                      return NoteWidget(
                        note: noteProvider.notes[index],
                        onDelete: () async {
                          await showCustomDialog(
                            context,
                            'Konfirmasi',
                            'Apakah Anda yakin ingin menghapus catatan ini?',
                            () => noteProvider
                                .deleteNote(noteProvider.notes[index].id),
                          );
                          Navigator.pop(context);
                        },
                        onEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(
                                  note: noteProvider.notes[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNoteScreen()),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
