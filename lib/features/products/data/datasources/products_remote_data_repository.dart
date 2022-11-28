import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/storage/local_storage_repository.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';

abstract class ProductsDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<ProductsModel> ProductsData(Page params);
  Future<ResponseModel> ProductsDelete(GetProductsDeleteData params);
  Future<ProductsModel> ProductsSearch(Search params);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  @override
  Future<ProductsModel> ProductsData(Page params) async {
    // TODO: implement getSliderData
    var header = {"content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      http.Response response = await http.get(Uri.parse("http://95.216.141.221/api/v1/product/product/?page=${params.page}"), headers: header);
      return ProductsModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } on DioError catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<ResponseModel> ProductsDelete(GetProductsDeleteData params) async {
    // TODO: implement ProductsDelete
    var header = {"content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      http.Response response = await http.delete(Uri.parse("http://95.216.141.221/api/v1/product/product/${params.id.toString()}/"), headers: header);
      return ResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } on DioError catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<ProductsModel> ProductsSearch(Search params) async {
    // TODO: implement ProductsDelete
    var header = {"content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      http.Response response = await http.get(Uri.parse("http://95.216.141.221/api/v1/product/product/?search=${params.search}"), headers: header);
      return ProductsModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } on DioError catch (e) {
      throw CacheException();
    }
  }
}
