import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'providers/note_provider.dart';
import 'providers/joke_provider.dart';
import 'models/note.dart';
import 'widgets/note_widget.dart';
import 'widgets/joke_widget.dart';
import 'widgets/custom_dialog.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteProvider()),
        ChangeNotifierProvider(create: (context) => JokeProvider()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(title: Text('Catatan Pribadi')),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: noteProvider.notes.length,
                    itemBuilder: (context, index) {
                      return NoteWidget(
                        note: noteProvider.notes[index],
                        onDelete: () {
                          showCustomDialog(
                            context,
                            'Konfirmasi',
                            'Apakah Anda yakin ingin menghapus catatan ini?',
                            () => noteProvider.deleteNote(index),
                          );
                        },
                        onEdit: () {
                          String title = noteProvider.notes[index].title;
                          String content = noteProvider.notes[index].content;
                          showCustomDialog(
                            context,
                            'Edit Catatan',
                            'Edit catatan Anda di sini.',
                            () {
                              noteProvider.addNote(
                                  Note(title: title, content: content));
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    String title = '';
                    String content = '';
                    showCustomDialog(
                      context,
                      'Tambah Catatan',
                      'Masukkan judul dan konten catatan.',
                      () {
                        if (title.isNotEmpty && content.isNotEmpty) {
                          noteProvider
                              .addNote(Note(title: title, content: content));
                        }
                      },
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
