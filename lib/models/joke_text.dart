class JokeText {
  String text;
  JokeText({required this.text});
  factory JokeText.fromJson(Map<String, dynamic> json) {
    return JokeText(text: json['data']);
  }
}
