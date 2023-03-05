import "package:flutter/material.dart";
import "package:flutter_application/NotesDB.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Sqldb sqldb = Sqldb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Container(
          child: Column(
        children: [
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                note x =
                    note(title: "Zedk", content: "high speed", favorite: 1);
                int response = await sqldb.insert(x);
                print(response);
              },
              child: Text('Insert Data'),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                List response = await sqldb.getProducts();
              },
              child: Text('Read Data'),
            ),
          ),
        ],
      )),
    );
  }
}
/*
    INSERT INTO "notes" (title, content, favorite) VALUES ("perfumes", "BlackVanille", 1),("Mlbb", "arlot", 0),("books", "harry potter", 1),
    */