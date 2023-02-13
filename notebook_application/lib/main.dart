import 'package:flutter/material.dart';
import 'package:notebook_application/notesPage.dart';
//import 'package:notebook_application/NotePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
