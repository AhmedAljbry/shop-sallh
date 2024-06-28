import 'package:dio/dio.dart';
class DioHalper {
  static late Dio dio;
  static inil()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,

      )
    );
  }
 static Future<Response> getdata({
    String lang='ar',
     String? token,
    required String url,
     Map<String,dynamic>? query,
}) async
  {
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token??'',
    };
  return await  dio.get(url,queryParameters:query);
  }
 static Future<Response> postdata({
    String lang='ar',
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String? token,
})async
  {
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token??'',
    };
   return await dio.post(url,data:data);
  }
  static Future<Response> putdata({
    String lang='ar',
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String? token,
  })async
  {
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token??'',
    };
    return await dio.put(url,data:data);
  }
}

