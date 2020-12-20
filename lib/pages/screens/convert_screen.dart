import 'package:bin2dec/managers/binary_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class ConverterScreen extends StatelessWidget with GetItMixin{
  final String title = "Converter";


  @override
  Widget build(BuildContext context) {
    registerHandler(
            (BinaryManager m) => m.updateResultCmd.thrownExceptions,
            (context, error, _) async {
              if(error != null){
                await showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: ()=>Navigator.of(context).pop(),
                      )
                    ],
                    title: const Text('Error'),
                    content: Text(error.toString()),
                  ),
                );
              }
            });
    //Creating states
    final isRunning = watchX((BinaryManager x) => x.updateResultCmd.isExecuting);
    final updateResult = watchX((BinaryManager x) => x.updateResultCmd.canExecute);
    final switchConverter = watchX((BinaryManager x) => x.switchConverterCmd);
    //Values
    final data = watchX((BinaryManager x) => x.updateResultCmd) ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(

        children: [
          Center(
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color(0xFF26282F),
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
                          onChanged: get<BinaryManager>().textChangedCmd,
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
