import 'dart:math';

class ConverterService{
  Future<String> binaryService(String input, bool inverted) async{
    if(input==null){
      input = "";
    }
    if(input.contains(RegExp(r'[^01]'))){
      throw Exception("Input must be 0 or 1");
    }
    int total = 0;
    for(int i = 0;i<input.length;i++){
      String value = input[i];
      int index = input.length-1-i;
      total = total+0*pow(2,index);
      if(value == '1'){
        total = total+1*pow(2,index);
      }
    }
    return total.toString();
  }
}