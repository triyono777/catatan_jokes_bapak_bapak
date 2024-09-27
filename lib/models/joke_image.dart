class JokeImage {
  String url;
  String source;
  JokeImage({required this.url, required this.source});
  factory JokeImage.fromJson(Map<String, dynamic> json) {
    return JokeImage(
      url: json['data']['url'],
      source: json['data']['source'],
    );
  }
}
