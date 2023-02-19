import 'package:flutter/material.dart';
import 'package:flutter_application/NotePage.dart';
import 'package:flutter_application/TODOListPage.dart';

class NotesPage extends StatefulWidget {
  @override
  List<String> title = [""];

  void AddNote(String titre) {
    this.title.add(titre);
  }

  _NotesPageState createState() => _NotesPageState();
}

class Note extends StatelessWidget {
  String title;
  Note(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xff333333),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Icon(
              Icons.star_border_rounded,
              color: Color(0xff555555),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Colors.white,
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
  List<String> titles = ["Life style", "Mlbb"];

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
        leading: Icon(
          Icons.sort_rounded,
          size: 30,
          color: Color(0xffffffff),
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
        child: GridView.count(
          mainAxisSpacing: 40,
          crossAxisSpacing: 60,
          crossAxisCount: 2,
          children: titles.map((title) {
            return Note(title);
          }).toList(),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
}

void _showDialog(BuildContext context) {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotePage()),
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