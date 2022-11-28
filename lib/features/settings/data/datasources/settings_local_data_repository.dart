import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/settings/data/models/setting_data_model.dart';

abstract class SettingsLocalDataSource {
  /// Gets the cached [ShowSliderModel] which is stored in assets/boardingdata/data/data.json
  /// run with or without internet Connection.
  ///
  /// Throws [CacheException] if no json data is present.
  Future<SettingsDataModel> getSliderData();
}

Future<dynamic> readJson() async {
  final String response = await rootBundle.loadString('assets/settings/data/data.json');
  final data = await json.decode(response);
  return data;
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  @override
  Future<SettingsDataModel> getSliderData() async {
    // TODO: implement getSliderData
    var data = await readJson();
    if (data != null) {
      Future<SettingsDataModel> result = Future.value(SettingsDataModel.fromJson(data));
      return result;
    } else {
      throw CacheException();
    }
  }
}

SettingsLocalDataSourceImpl dataSourceImpl = SettingsLocalDataSourceImpl();
