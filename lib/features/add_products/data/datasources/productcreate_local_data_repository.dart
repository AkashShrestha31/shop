import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/storage/local_storage_repository.dart';
import 'package:shoppos/features/add_products/data/models/create_product_model.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

abstract class ProductCreateDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<ResponseModel> ProductCreate(ProductCreateModel params);
  Future<ResponseModel> ProductUpdate(ProductCreateModel params);
}

class ProductCreateDataSourceImpl implements ProductCreateDataSource {
  @override
  Future<ResponseModel> ProductCreate(ProductCreateModel params) async {
    List<MultipartFile> product_image = [];
    for (int i = 0; i < params.productImage!.length; i++) {
      product_image.add(await MultipartFile.fromFile(params.productImage![i].path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + "." + params.productImage![i].path.split('/').last.split('.')[1]));
    }
    print(params.subAttribute);
    Dio dio = Dio();
    var formData = FormData.fromMap({
      'category_name': params.category,
      'brand_name': params.brand,
      'product_name': params.productName,
      'quantity': params.quantity,
      'cost_price': params.cost_price,
      'variants': params.subAttribute!.toSet(),
      'barcode': 'fafa',
      'description': params.description,
      'thumbnail': await MultipartFile.fromFile(params.thumbnail_image!.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + "." + params.thumbnail_image!.path.split('/').last.split('.')[1]),
      "product_image": product_image
    });

    var header = {"Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      var res = await dio.post("http://95.216.141.221/api/v1/product/product/", options: Options(headers: header), data: formData);
      return ResponseModel.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        settingsBloc.updateScreenStatus(30);
        Fluttertoast.showToast(
            msg: ResponseModel.fromJson(e.response!.data).message!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: infoColor,
            fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
      }
      throw CacheException();
    }
  }

  @override
  Future<ResponseModel> ProductUpdate(ProductCreateModel params) async {
    List<MultipartFile> product_image = [];
    for (int i = 0; i < params.productImage!.length; i++) {
      product_image.add(await MultipartFile.fromFile(params.productImage![i].path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + "." + params.productImage![i].path.split('/').last.split('.')[1]));
    }
    Dio dio = Dio();
    var formData = FormData.fromMap({
      'category_name': params.category,
      'brand_name': params.brand,
      'product_name': params.productName,
      'quantity': params.quantity,
      'cost_price': params.cost_price,
      'variants': [
        {"attribute": 3, "value": "Red"},
        {"attribute": 4, "value": "Yellow"}
      ],
      'barcode': 'fafa',
      'description': params.description,
      'thumbnail': await MultipartFile.fromFile(params.thumbnail_image!.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + "." + params.thumbnail_image!.path.split('/').last.split('.')[1]),
      "product_image": product_image
    });
    print({
      'category_name': params.category,
      'brand_name': params.brand,
      'product_name': params.productName,
      'quantity': params.quantity,
      'cost_price': params.cost_price,
      'variants': [
        {"attribute": 3, "value": "Red"},
        {"attribute": 4, "value": "Yellow"}
      ],
      'barcode': 'fafa',
      'description': params.description,
      'thumbnail': await MultipartFile.fromFile(params.thumbnail_image!.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + "." + params.thumbnail_image!.path.split('/').last.split('.')[1]),
      "product_image": product_image
    });
    var header = {"content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer " + localRepoImpl.getToken()};
    try {
      var res = await dio.post("http://95.216.141.221/api/v1/product/product/", options: Options(headers: header), data: formData);
      print("the data is ${res.data}");
      return ResponseModel.fromJson(res.data);
    } on DioError catch (e) {
      print("error is ${e.stackTrace}");
      throw CacheException();
      ;
    }
  }
}
