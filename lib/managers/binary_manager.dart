import 'package:bin2dec/Service/converter_service.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';

// code reference: https://github.com/escamoteur/RVMS-2020/blob/main/example/lib/home_page/_manager/weather_manager.dart
class BinaryManager{
  Command<String, String> updateOutputCmd;
  Command<String, String> inputChangedCmd;
  Command<bool, bool> switchConverterCmd;
  BinaryManager(){
    switchConverterCmd  = Command.createSync<bool,bool>((x) => x, false);
    updateOutputCmd = Command.createAsync<String, String>(
        (x) async{
          return GetIt.I<ConverterService>().binaryService(x, false);
        } // Converter logic
    ,"" // Initial value
    );
    inputChangedCmd = Command.createSync(
    (x) => x, // input logic filter
    "" // initial value
    );
    inputChangedCmd.debounce(
    Duration(milliseconds: 300))
        .listen((filterText, _) {
          updateOutputCmd.execute(filterText);
    });
    updateOutputCmd.thrownExceptions.listen((exception,_)=>print(exception.toString()));
    updateOutputCmd.execute();
    }
}
