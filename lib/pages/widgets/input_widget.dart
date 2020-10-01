import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final Stream stream;
  final Function onChanged;

  const InputWidget({Key key, this.stream, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (_, snapshot) {
          return ListTile(
            title: TextField(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), errorText: snapshot.error),
              onChanged: onChanged,
            ),
          );
        });
  }
}
