class Note {
  String title;
  String description;
  DateTime lastModify;

  Note(
      {required this.title,
      required this.description,
      required this.lastModify});
}

List<Note> allNotes = [
  Note(
      title: "My First Note",
      description: "This is dummy data",
      lastModify: DateTime.now())
];
