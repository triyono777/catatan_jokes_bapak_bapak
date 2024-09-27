import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_image.dart';
import '../models/joke_text.dart';

class JokeService {
  Future<JokeText> fetchRandomJokeText() async {
    final response = await http
        .get(Uri.parse('https://candaan-api.vercel.app/api/text/random'));
    if (response.statusCode == 200) {
      return JokeText.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke text');
    }
  }

  Future<JokeImage> fetchRandomJokeImage() async {
    final response = await http
        .get(Uri.parse('https://candaan-api.vercel.app/api/image/random'));
    if (response.statusCode == 200) {
      return JokeImage.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke image');
    }
  }
}
