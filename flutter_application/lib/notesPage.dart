import 'package:flutter/material.dart';
import 'package:flutter_application/NotePage.dart';
import 'package:flutter_application/NotesDB.dart';
import 'package:flutter_application/TODOListPage.dart';
import 'package:flutter_application/NoteDetails.dart';
import 'package:flutter_application/favoritesPage.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class NotesPage extends StatefulWidget {
  bool sorted_by_title;
  bool sorted_by_modification;
  NotesPage(this.sorted_by_title, this.sorted_by_modification);
  @override
  _NotesPageState createState() => _NotesPageState();
}

class Note extends StatefulWidget {
  late note n;
  Note(this.n);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  void _toggleFavorite() {
    setState(() {
      if (int.tryParse(widget.n.favorite.toString()) == null) {
        widget.n.favorite = 1;
      } else {
        widget.n.favorite = null;
      }
    });
    note x = note.withId(
      id: widget.n.id,
      title: widget.n.title,
      content: widget.n.content,
      favorite: widget.n.favorite,
    );
    sqldb.update(x);
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xff333333),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: GestureDetector(
              onTap: _toggleFavorite,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Icon(
                  widget.n.favorite == 1
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: widget.n.favorite == 1
                      ? Color(0xff37d98b)
                      : Color(0xff555555),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteDetails(widget.n)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Container(
                width: 55,
                child: Text(
                  widget.n.title.toString(),
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "BlackNote",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => _sortDialog(context),
          child: Icon(
            Icons.sort_rounded,
            size: 30,
            color: Color(0xffffffff),
          ),
        ),
        actions: [
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Color(0xff222222),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: FutureBuilder<dynamic>(
          future: widget.sorted_by_title
              ? sqldb.getNotesSorted()
              : widget.sorted_by_modification
                  ? sqldb.getNotesModified()
                  : sqldb.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List list = snapshot.data!;
              return GridView.count(
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 60,
                  crossAxisCount: 2,
                  children: list.map((x) {
                    return Note(x);
                  }).toList());
            } else if (snapshot.hasError) {
              return Text('Error fetching data from database');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff111111),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      sqldb.display();
                    },
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showDialog(context),
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: Color(0xff37d98b),
                      child: Icon(
                        Icons.add_rounded,
                        size: 30,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => favoritesPage()));
                    },
                    icon: Icon(
                      Icons.star_border_rounded,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_rounded,
                      color: Color(0xffffffff),
                      size: 35,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void _sortDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Color(0xff222222),
            child: Container(
              height: 200,
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotesPage(true, false)),
                        );
                      },
                      child: Text(
                        "titre",
                        style: TextStyle(
                          color: Color(0xff37d98b),
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff333333),
                    indent: 30,
                    endIndent: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotesPage(false, false)),
                        );
                      },
                      child: Text(
                        "Date de création",
                        style: TextStyle(
                          color: Color(0xff37d98b),
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff333333),
                    indent: 30,
                    endIndent: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotesPage(false, true)),
                        );
                      },
                      child: Text(
                        "Date de modification",
                        style: TextStyle(
                          color: Color(0xff37d98b),
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

void _showDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Color(0xff222222),
        child: Container(
          height: 100,
          width: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    note x = note(title: "", content: "", favorite: 0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotePage(x)),
                    );
                  },
                  child: Text(
                    "Note",
                    style: TextStyle(
                      color: Color(0xff37d98b),
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Color(0xff333333),
                indent: 30,
                endIndent: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TODOListPage()),
                    );
                  },
                  child: Text(
                    "Liste de vérifications",
                    style: TextStyle(
                      color: Color(0xff37d98b),
                      fontFamily: "Poppins",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
