import 'package:flutter/material.dart';
import '../models/joke_image.dart';
import '../models/joke_text.dart';
import '../services/joke_service.dart';

class JokeProvider with ChangeNotifier {
  final JokeService _jokeService = JokeService();
  JokeText? _jokeText;
  JokeImage? _jokeImage;

  JokeText? get jokeText => _jokeText;
  JokeImage? get jokeImage => _jokeImage;

  void loadJoke() async {
    _jokeText = await _jokeService.fetchRandomJokeText();
    _jokeImage = await _jokeService.fetchRandomJokeImage();
    notifyListeners();
  }

  void refreshJoke() {
    loadJoke();
  }
}
