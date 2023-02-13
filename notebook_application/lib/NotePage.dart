import 'package:flutter/material.dart';
import 'package:notebook_application/notesPage.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 22,
                    color: Color(0xff999999)),
                fillColor: Color(0xff999999)),
            cursorColor: Color(0xff37d98b),
            style: TextStyle(
                fontFamily: "Poppins", fontSize: 18, color: Color(0xff999999)),
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
              color: Color(0xff37d98b),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
        child: TextField(
          maxLines: 100,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Notes",
            hintStyle: TextStyle(
              fontFamily: "Poppins",
              fontSize: 30,
              color: Color(0xff999999),
            ),
          ),
          cursorColor: Color(0xff37d98b),
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 30, color: Color(0xffeeeeee)),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 30, 30, 30),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => {
                NotePage n = new NotesPage();
                
                }),
            );
          },
          child: Container(
              height: 50,
              child: Center(
                  child: Text(
                'Enregistrer',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    color: Color(0xff37d98b)),
              ))),
        ),
      ),
    );
  }
}
