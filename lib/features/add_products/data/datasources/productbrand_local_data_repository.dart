import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/storage/local_storage_repository.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productbrand_model.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';

abstract class ProductBrandDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<ProductBrandModel> ProductBrand(NoParams params);
}

class ProductBrandDataSourceImpl implements ProductBrandDataSource {
  @override
  Future<ProductBrandModel> ProductBrand(NoParams params) async {
    // TODO: implement getSliderData
    // TODO: implement getSliderData
    var header = {"content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      http.Response response = await http.get(Uri.parse("http://95.216.141.221/api/v1/setting/dropdown-brand/"), headers: header);
      print("fafaf  ${jsonDecode(utf8.decode(response.bodyBytes))}");
      return ProductBrandModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } on DioError catch (e) {
      throw CacheException();
    }
  }
}
