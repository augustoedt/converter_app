import 'package:bin2dec/managers/binary_manager.dart';
import 'package:bin2dec/managers/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class ConverterScreen extends StatelessWidget with GetItMixin{
  final String title = "Converter";


  @override
  Widget build(BuildContext context) {
    registerHandler(
            (BinaryManager m) => m.updateOutputCmd.thrownExceptions,
            (__, error, _) async {
              final snackBar = SnackBar(content: Text(error.toString()), duration: Duration(milliseconds: 500),);
              if(error != null){
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            });
    //Creating states
    final isRunning = watchX((BinaryManager x) => x.updateOutputCmd.isExecuting);
    //Values
    final data = watchX((BinaryManager x) => x.updateOutputCmd) ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: (){
              get<ThemeManager>().changeTheme();
            },
          )
        ],
      ),
      body: Stack(

        children: [
          Center(
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Binary'),
                        TextField(
                          maxLines: null,
                          style: Theme.of(context).textTheme.headline2,
                          onChanged: get<BinaryManager>().inputChangedCmd,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400, height: 300,
                    child: Text(data,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
                ],
              ),
            ),
          ),
          if(isRunning)
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF1AB965),
              ),
            )
        ],
      ),
    );
  }
}
