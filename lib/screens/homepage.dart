import "package:flutter/material.dart";
import "package:notes_app/models/note.dart";
import "package:notes_app/screens/newnote.dart";
import "package:notes_app/widget/mainDrawer.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewNodeScreen()));
            },
            child: Icon(Icons.add)),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text("Notes App"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        drawer: MainDrawer(),
        body: (allNotes.length == 0)
            ? Center(
                child: Text(
                  "No Notes Found",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : AllNoddesBody());
  }
}

class AllNoddesBody extends StatefulWidget {
  const AllNoddesBody({super.key});

  @override
  State<AllNoddesBody> createState() => _AllNoddesBodyState();
}

class _AllNoddesBodyState extends State<AllNoddesBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black),
            child: Card(
              elevation: 10,
              color: Colors.black,
              child: ListTile(
                title: Text(
                  allNotes[index].title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(allNotes[index].description,
                    style: const TextStyle(color: Colors.white)),
                // tileColor: Colors.black,
              ),
            ),
          ),
        );
      },
      itemCount: allNotes.length,
    );
  }
}
