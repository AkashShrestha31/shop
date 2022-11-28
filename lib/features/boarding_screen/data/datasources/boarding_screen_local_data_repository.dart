import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';

abstract class BoardingScreenLocalDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<ShowSliderModel> getSliderData();
}

Future<dynamic> readJson() async {
  final String response = await rootBundle.loadString('assets/boardingdata/data/data.json');
  final data = await json.decode(response);
  return data;
}

class BoardingScreenLocalDataSourceImpl implements BoardingScreenLocalDataSource {
  @override
  Future<ShowSliderModel> getSliderData() async {
    // TODO: implement getSliderData
    var data = await readJson();
    if (data != null) {
      Future<ShowSliderModel> result = Future.value(ShowSliderModel.fromJson(data));
      return result;
    } else {
      throw CacheException();
    }
  }
}
