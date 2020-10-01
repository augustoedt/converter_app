import 'dart:async';

class Validation {
  final validateInput = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink){
      RegExp exp = new RegExp(r'[^01]');
      if(value.contains(exp)){
        Iterable<Match> matches = exp.allMatches(value);
        List<String> matchValues = matches.map((e) => e.group(0)).toList();
        sink.addError('invalid ${matchValues.toString()} binary input.');
      }else{
        sink.add(value);
      }
    },
  );

}