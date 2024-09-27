import 'package:flutter/material.dart';
import '../models/joke_image.dart';
import '../models/joke_text.dart';

class JokeWidget extends StatelessWidget {
  final JokeText jokeText;
  final JokeImage jokeImage;
  final Function onRefresh;

  JokeWidget(
      {required this.jokeText,
      required this.jokeImage,
      required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(jokeText.text, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Image.network(jokeImage.url),
        TextButton(
          onPressed: () => onRefresh(),
          child: Text('Refresh Jokes'),
        ),
      ],
    );
  }
}
