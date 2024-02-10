import "package:flutter/material.dart";
import "package:notes_app/screens/homepage.dart";
import "package:notes_app/screens/newnote.dart";

//it is the main method
void main() {
  //runApp() is a method, provided by material.dart. it takes widget as an argument amd it runs the app.
  runApp(notes_app());
}

class notes_app extends StatelessWidget {
  //it is a stateless widget.
  const notes_app({super.key});

  @override
  Widget build(BuildContext context) {
    //materialApp() is a widget. it is a stateless widget. it contains the information that is common to the entire app (eg. route,theme,homepage etc.)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[900],
      ), // ThemeData is a class
      home: HomePage(),
    );
  }
}
