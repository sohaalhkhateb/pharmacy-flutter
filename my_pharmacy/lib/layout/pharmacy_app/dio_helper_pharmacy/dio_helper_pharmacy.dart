import 'package:dio/dio.dart';

class DioHelperPharmacy
{
  static late Dio dio;
  static const String defaultLang = 'ar';
  static String? authToken;

  static init()
  {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: 'http://192.168.43.222:5000',
        receiveDataWhenStatusError: true,
        headers: {
          'content-type':'application/json',
        }
      )
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request URL: ${options.uri}');
        print('Request Data: ${options.data}');
        print('Request Headers: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response Status Code: ${response.statusCode}');
        print('Response Data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('Error: ${e.message}');
        if (e.response != null) {
          print('Error Response: ${e.response?.data}');
        }
        return handler.next(e);
      },
    ));
  }


  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
    String? lang = defaultLang,
    String? token,
}) async
  {
      return await dio.get(
        url,
        queryParameters: query,
        options: Options(
    headers: {
      'lang': lang ?? defaultLang,
      'Authorization': token ?? authToken ?? '',
      'Content-Type': 'application/json',
    },
  ),
      );
    }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang = defaultLang,
    String? token,
}) async
  {
    return dio.post(
      url,
      queryParameters: query,
      data: data,
       options: Options(
    headers: {
      'lang': lang ?? defaultLang,
      'Authorization': token ?? authToken ?? '',
      'Content-Type': 'application/json',
    },
  ),
    );
  }
    }