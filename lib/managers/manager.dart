import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'validation.dart';



class Manager with Validation{
  var _input = BehaviorSubject<String>.seeded("");
  Stream<String> get input$ => _input.stream.transform(validateInput);
  void fillInput(String value) => _input.sink.add(value);

  var _switch = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get switchStream$ => _switch.stream;



  StreamController _controller = StreamController<String>();
  Stream<String> get convertedResult => _controller.stream;




  Manager(){
    input$.listen((binary) =>calculator(binary, _switch.stream.value)
      ,onError: (error){
        _controller.addError(error);
      }
    );
  }
  void switchValue(bool value){
    _switch.add(value);
  }

  void calculator(String binary, bool lms){
    if(lms==null) lms=false;
    int total = 0;
    for(int i = 0;i<binary.length;i++){
      var value = binary[i];
      int index = lms?i:binary.length-1-i;
      if(value == '0'){
        total = total+0*pow(2,index);
      }
      if(value == '1'){
        total = total+1*pow(2,index);
      }
    }
    _controller.add(total.toString());
  }
}
