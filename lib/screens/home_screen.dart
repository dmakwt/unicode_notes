import 'package:flutter/material.dart';
import 'package:flutter_application_notes_app/models/note.dart';
import 'package:flutter_application_notes_app/widgets/note_item.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();

  final bodyController = TextEditingController();

  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بسم الله',
          style: GoogleFonts.cairo(),
        ),
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              notes.insert(
                0,
                Note(title: titleController.text, body: bodyController.text),
              );
              titleController.clear();
              bodyController.clear();

              setState(() {});
            },
            icon: Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(18),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: TextField(
              controller: bodyController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Body',
                hintStyle: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteItem(newNote: notes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
