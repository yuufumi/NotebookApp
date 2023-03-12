import 'package:flutter/material.dart';
import 'package:flutter_application/notesPage.dart';
import 'package:flutter_application/NotePage.dart';
import 'package:flutter_application/NotesDB.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(false, false),
    );
  }
}
