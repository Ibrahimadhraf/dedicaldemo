import 'package:get_storage/get_storage.dart';

class LanguageManager{
  LanguageManager ._internal();
  static final LanguageManager _instance = LanguageManager._internal();
  factory LanguageManager()=>_instance;
  // write
   saveToDisk(String language) async{
       await GetStorage().write('lang', language);
   }
   //read
Future<String > get laguaeSelected async{
  return GetStorage().read('lang')??'en';
}
}