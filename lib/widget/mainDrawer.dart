import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/homepage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: padding.top,
          color: Colors.black,
        ),
        Container(
          color: Colors.black,
          height: (size.height * 0.3),
          child: const Center(
            child: Text(
              "Welcome Mahi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
        ListTile(
          tileColor: Colors.grey[800],
          title: Text(
            "Delete all notes",
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Delete all notes ?"),
                content: Text("Are you sure you want to delete all notes ?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No")),
                  TextButton(
                    onPressed: () {
                      allNotes.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Text("Yes"),
                  )
                ],
              ),
            );
          },
        ),
        const Divider(
          height: 1,
        ),
      ]),
    );
  }
}
