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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder(
                  initialData: true,
                  stream:MyApp.manager.switchStream$,
                  builder: (_, snapshot) {
                    return Switch(
                      value: snapshot.data,
                      onChanged: (val){
                        MyApp.manager.switchValue(val);
                      },
                    );
                  }
              ),
              StreamBuilder(
                  stream: MyApp.manager.input$,
                  builder: (_, snapshot) {
                    return ListTile(
                      title: TextField(
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                        decoration:
                        InputDecoration().copyWith(errorText: snapshot.error),
                        onChanged: (value) {
                          MyApp.manager.fillInput(value);
                        },
                      ),
                    );
                  }),
              StreamBuilder(
                  initialData: "0",
                  stream: MyApp.manager.convertedResult,
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
                        "invalid binary",
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
