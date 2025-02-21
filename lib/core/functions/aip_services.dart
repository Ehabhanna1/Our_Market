import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/functions/senstive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://qrevfiwchdguvtyztgus.supabase.co/rest/v1/",
      headers: {
        'apiKey': anonsKey,
        
      },
    ),
  );

  Future<Response> getData(String url) async {
    return await _dio.get(url);
  }
  Future<Response> postData(String url, Map<String, dynamic> data) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> patchData(String url, Map<String, dynamic> data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> deleteData(String url) async {
    return await _dio.delete(url);
  }


}