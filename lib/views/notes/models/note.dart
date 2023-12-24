



class Note {

  final String noteName;

  String noteContent;

  final DateTime lastChangeDate;



  Note({
    required this.noteName,
    required this.noteContent,
    required this.lastChangeDate,
  });

  static Note fromJson(e) {
    return Note(
      noteName: e['noteName'],
      noteContent: e['noteContent'],
      lastChangeDate: DateTime.parse(e['lastChangeDate']),
    );
  }


  toJson() {
    return {
      "noteName": noteName,
      "noteContent": noteContent,
      "lastChangeDate": lastChangeDate.toIso8601String(),
    };
  }

}