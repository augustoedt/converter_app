import 'package:flutter/material.dart';
class OutputWidget extends StatelessWidget {
  final Stream stream;

  const OutputWidget({Key key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: "0",
        stream: stream,
        builder: (_, snapshot) {
          TextStyle style =
          TextStyle(fontSize: 50, fontWeight: FontWeight.w700);
          if (snapshot.hasData) {
            return Text(
              snapshot.data,
              style: style,
            );
          }
          if (snapshot.hasError) {
            return Text(
              'invalid input',
              style: style,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
