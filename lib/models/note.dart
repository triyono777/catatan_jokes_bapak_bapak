class Note {
  String title;
  String content;
  Note({required this.title, required this.content});
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
  static Note fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
    );
  }
}
