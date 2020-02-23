
import 'dart:io';

import 'package:dio/dio.dart';

Future<Response> get(String url,Map<String, dynamic> params) async{
  Dio dio = Dio();
  try{
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return await dio.get(url,queryParameters: params);
  } on DioError catch (e){
    if (e == null) {
      return Future.error(Response(data: -1));
    } else if (e.response != null) {
      if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
        return Future.error(Response(data: -1));
      } else {
        return Future.value(e.response);
      }
    } else {
      return Future.error(Response(data: -1));
    }
  }
}

Future post(String url,{params}) async{
  Dio dio = Dio();
  dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
  Response response = await dio.post(url,data: params);
  print(response);
  if (response.statusCode == 200){
    return response.data;
  } else {
    return Future.error(Response(data: -1));
  }
}