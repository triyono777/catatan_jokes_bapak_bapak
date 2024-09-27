import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String content;

  Note({required this.title, required this.content}) : id = Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
      };

  static Note fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
    )..id = json['id'];
  }
}
