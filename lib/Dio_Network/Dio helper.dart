import 'package:dio/dio.dart';

import '../components/Model_login.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdata(
      {required String Url,
      Map<String ,dynamic >? query,
      String? token,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return await dio.get(Url, queryParameters: query);
  }

  static Future<Response> postdata({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,


  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }
}
