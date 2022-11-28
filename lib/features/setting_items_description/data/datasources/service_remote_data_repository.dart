import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/setting_items_description/data/models/service_model.dart';

abstract class ServiceDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<ServiceModel> ServiceCharge(NoParams params);
}

class ServiceDataSourceImpl implements ServiceDataSource {
  @override
  Future<ServiceModel> ServiceCharge(NoParams params) async {
    // TODO: implement getSliderData
    var header = {
      "content-type": "application/json",
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo0NzczMjgwNDAzLCJpYXQiOjE2NjI4ODA0MDMsImp0aSI6IjFkZjkzNmY2NWRjYzRiMGM4ZmYyY2EzNDk4ZTAyMzcxIiwidXNlcl9pZCI6Mn0.hJ00m0ZuTBCu1hwPmvyh-lVGVoNRACRMjsvjH-4U4L4"
    };
    try {
      http.Response response = await http.get(Uri.parse("http://95.216.141.221/api/v1/sale/order_service_charge/"), headers: header);
      print(ServiceModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))).count);
      return ServiceModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } on DioError catch (e) {
      throw CacheException();
    }
  }
}
