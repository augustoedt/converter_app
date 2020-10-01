import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'validation.dart';



class Manager with Validation{
  BehaviorSubject _input = BehaviorSubject<String>.seeded("");
  Stream<String> get input$ => _input.stream.transform(validateInput);
  void myInput(String value) => _input.sink.add(value);


  PublishSubject<String> _output = PublishSubject();
  Stream<String> get output$ => _output.stream;


  Manager(){
    input$.listen((binary) =>parseToDecimal(binary)
      ,onError: (error){
          _output.addError(error);
      }
    );
  }

  void parseToDecimal(String binary){
    int total = 0;
    for(int i = 0;i<binary.length;i++){
      String value = binary[i];
      int index = binary.length-1-i;
        total = total+0*pow(2,index);
      if(value == '1'){
        total = total+1*pow(2,index);
      }
    }
    _output.add(total.toString());
  }

  void dispatch(){
    _input.close();
    _output.close();
  }
}
