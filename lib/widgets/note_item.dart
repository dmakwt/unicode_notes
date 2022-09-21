import 'package:flutter/material.dart';

import 'package:flutter_application_notes_app/models/note.dart';
import 'package:flutter_application_notes_app/screens/note_screen.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.newNote,
  }) : super(key: key);

  final Note newNote;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteScreen(
                      newNote: newNote,
                    )),
          );
        },
        title: Text(newNote.title),
        subtitle: Text(newNote.body),
      ),
    );
  }
}
