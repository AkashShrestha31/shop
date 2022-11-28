import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/login_screen/data/models/show_slider_model.dart';

abstract class LoginDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<LoginModel> Login(Params params);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginModel> Login(Params params) async {
    // TODO: implement getSliderData
    Dio dio = Dio();
    var formData = {'phone': params.username, 'password': params.password};
    try {
      dio.interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
        ),
      );
      var res = await dio.post("http://95.216.141.221/api/v1/user/login/", data: FormData.fromMap(formData));
      print(res.data);
      return LoginModel.fromJson(res.data);
    } on DioError catch (e) {
      throw CacheException();
    }
  }
}
