import 'package:dio/dio.dart';

class BaseApi {
  late Dio dio;
  static final BaseApi _baseApi = BaseApi._internal();

  factory BaseApi() {
    return _baseApi;
  }

  BaseApi._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://ifi-lms.com',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }
}
