import 'dart:async';

class Validation {
  final validateInput = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink){
      print(value);
      if(value.contains(RegExp(r'[^01]'))){
        sink.addError('not valid binary');
      }else{
        sink.add(value);
      }
    },
  );

}