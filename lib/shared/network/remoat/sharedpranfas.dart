import 'package:shared_preferences/shared_preferences.dart';
class CachHelper
{
  static late SharedPreferences sharedpreferences;
  static init()async
  {
    sharedpreferences=await SharedPreferences.getInstance();
  }
  static dynamic getdate({
    required String key,
})
  {
    return  sharedpreferences.get(key);
  }
  static Future<bool> savadate({
    required String key,
    required dynamic value
})async
  {
  if(value is double) return await sharedpreferences.setDouble(key, value);
  if(value is String) return await sharedpreferences.setString(key, value);
  if(value is int)  return await sharedpreferences.setInt(key, value);
   return await sharedpreferences.setBool(key, value);

  }
  static Future<bool> removedata(
  {
 required String token,
})
  {
   return sharedpreferences.remove(token);
  }
}
