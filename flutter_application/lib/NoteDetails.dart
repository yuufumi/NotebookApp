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
              onPressed: () => _showDialog(context)

              /**/
              ,
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
        child: SingleChildScrollView(
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
      ),
    );
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
              height: 150,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Are you sure you want to delete this?",
                      style: TextStyle(
                        color: Color(0xffeeeeee),
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Color(0xff333333),
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              sqldb.delete(widget.n.id!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotesPage(false, false)),
                              );
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  color: Color(0xff37d98b),
                                  fontFamily: "Poppins",
                                  fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "No",
                              style: TextStyle(
                                  color: Color(0xff37d98b),
                                  fontFamily: "Poppins",
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
