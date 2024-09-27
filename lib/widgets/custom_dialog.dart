import 'package:flutter/material.dart';

Future<void> showCustomDialog(
    BuildContext context, String title, String content, Function onConfirm) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: Text('Konfirmasi'),
          ),
        ],
      );
    },
  );
}
