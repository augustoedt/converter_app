import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Bin2Dec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Binary to Decimal"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: MyApp.manager.input$,
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    return ListTile(
                      title: TextField(
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: snapshot.error
                        ),
                        onChanged: (value) {
                          MyApp.manager.myInput(value);
                        },
                      ),
                    );
                  }),
              Divider(),
              StreamBuilder(
                  initialData: "0",
                  stream: MyApp.manager.output$,
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
                  })
            ],
          )),
    );
  }
}
