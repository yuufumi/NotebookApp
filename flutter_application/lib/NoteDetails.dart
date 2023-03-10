import 'package:flutter/material.dart';
import 'package:flutter_application/NotesDB.dart';
import 'package:flutter_application/notesPage.dart';
import 'package:flutter_application/NotePage.dart';

class NoteDetails extends StatefulWidget {
  late note n;
  NoteDetails(this.n);
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
          child: Container(),
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Color(0xff37d98b),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.lock_outlined,
                color: Color(0xff37d98b),
              )),
          IconButton(
              onPressed: () {
                sqldb.delete(widget.n.id!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotesPage.withoutList()),
                );
              },
              icon: Icon(
                Icons.delete_outline,
                color: Color(0xff37d98b),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotePage(widget.n)),
                );
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Color(0xff37d98b),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 20, 26, 0),
        child: Column(
          children: [
            Text(
              widget.n.title!,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  color: Color(0xff37d98b)),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              widget.n.content!,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 26,
                  color: Color(0xffeeeeee)),
            ),
          ],
        ),
      ),
    );
  }
}
