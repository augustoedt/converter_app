import 'package:bin2dec/pages/widgets/input_widget.dart';
import 'package:bin2dec/pages/widgets/output_widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
              InputWidget(
                stream: MyApp.manager.input$,
                onChanged: (value){
                  MyApp.manager.myInput(value);
                },
              ),
              Divider(),
              OutputWidget(
                stream: MyApp.manager.output$,
              )
            ],
          )),
    );
  }
}
