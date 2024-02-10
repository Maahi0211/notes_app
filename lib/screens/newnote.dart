import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/homepage.dart';

class NewNodeScreen extends StatefulWidget {
  const NewNodeScreen({super.key});

  @override
  State<NewNodeScreen> createState() => _NewNodeScreenState();
}

class _NewNodeScreenState extends State<NewNodeScreen> {
  var _formkey = GlobalKey<FormState>();
  var _descriptionController = TextEditingController();
  var _titleController = TextEditingController();
  void _save() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();
    var title = _titleController.text;
    var description = _descriptionController.text;
    Note newnote = Note(
        title: title.toString(),
        description: description.toString(),
        lastModify: DateTime.now());
    allNotes.add(newnote);
    print(allNotes);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            title: const Text("Create new note"),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            actions: [
              IconButton(onPressed: _save, icon: const Icon(Icons.save))
            ]),
        body: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.white
                    ),
                    child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            fillColor: Colors.black,
                            hintText: "Title",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                        controller: _titleController,
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return "Title cannot be empty";
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return "Description cannot be empty";
                          }
                          return null;
                        }),
                  ),
                )
              ],
            )));
  }
}
