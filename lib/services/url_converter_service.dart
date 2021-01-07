import 'package:bin2dec/services/converter_service.dart';

class UrlConverterService implements ConverterService{
  @override
  Future<String> converter(String input, bool inverted) async {
    if(input == null) input = "";
    List<String> splitInput = input.split('');
    List<String> output = [];
    if(input ==  null){
      input = "";
    }
    for(var value in splitInput){
      if(value == ' ') output.add('%20');
      else if(value == '!') output.add('%21');
      else if(value == '"') output.add('%22');
      else if(value == '#') output.add('%23');
      else if(value == '\$') output.add('%24');
      else if(value == '%') output.add('%25');
      else if(value == '&') output.add('%26');
      else if(value == "'") output.add('%27');
      else if(value == '(') output.add('%28');
      else if(value == ')') output.add('%29');
      else if(value == '*') output.add('%2A');
      else if(value == '+') output.add('%2B');
      else if(value == ',') output.add('%2C');
      else if(value == '-') output.add('%2D');
      else if(value == '.') output.add('%2E');
      else if(value == '/') output.add('%2F');
      else if(value == ':') output.add('%3A');
      else if(value == ';') output.add('%3B');
      else if(value == '<') output.add('%3C');
      else if(value == '=') output.add('%3D');
      else if(value == '>') output.add('%3E');
      else if(value == '?') output.add('%3F');
      else if(value == '@') output.add('%40');
      else if(value == '[') output.add('%5B');
      else if(value == '\\') output.add('%5C');
      else if(value == ']') output.add('%5D');
      else if(value == '^') output.add('%5E');
      else if(value == '_') output.add('%5F');
      else if(value == '`') output.add('%60');
      else if(value == '{') output.add('%7B');
      else if(value == '|') output.add('%7C');
      else if(value == '}') output.add('%7D');
      else if(value == '~') output.add('%7E');
      else output.add(value);

    }
    return output.join('');
  }

}