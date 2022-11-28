import 'package:dio/dio.dart';

class NetworkCall {
  Dio createDio() {
    return Dio(BaseOptions(connectTimeout: 5000, receiveTimeout: 5000, baseUrl: "http://95.216.141.221"));
  }

  // Dio addInterceptors(Dio dio) {
  //   return dio
  //     ..interceptors.add(InterceptorsWrapper(
  //         onRequest: (RequestOptions options, RequestInterceptorHandler handler) => super.onRequest(options, handler);,
  //         onResponse: (Response response) => responseInterceptor(response),
  //         onError: (DioError dioError) => errorInterceptor(dioError)));
  // }
}
