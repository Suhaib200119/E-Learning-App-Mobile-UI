import 'package:shared_preferences/shared_preferences.dart';

class Sp{

  late SharedPreferences sp;


  setLangSp({required String key,required String value})async{
    sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

 Future<String?> getLngSp({required String key})async{
    sp = await SharedPreferences.getInstance();
   return sp.getString(key);
  }


}