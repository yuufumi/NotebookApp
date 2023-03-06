import 'package:flutter/material.dart';
import 'package:flutter_application/NotesDB.dart';
import 'package:flutter_application/notesPage.dart';

class NoteDetails extends StatefulWidget {
  late int? id;
  NoteDetails(this.id);
  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: FutureBuilder<dynamic>(
            future: sqldb.getNoteById(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                note n = snapshot.data!;
                return Text(
                  n.title.toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 30,
                      color: Color(0xffeeeeee)),
                );
              } else if (snapshot.hasError) {
                return Text('Error fetching data from database');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
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
        child: FutureBuilder<dynamic>(
          future: sqldb.getNoteById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              note n = snapshot.data!;
              return Text(
                n.content.toString(),
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    color: Color(0xffeeeeee)),
              );
            } else if (snapshot.hasError) {
              return Text('Error fetching data from database');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
