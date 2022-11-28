import 'package:rxdart/rxdart.dart';
import 'package:shoppos/features/settings/data/datasources/settings_local_data_repository.dart';
import 'package:shoppos/features/settings/data/models/setting_data_model.dart';

class SettingsDataBloc {
  // ignore: close_sinks
  final BehaviorSubject<SettingsDataModel> _settingsData = BehaviorSubject<SettingsDataModel>();
  Stream<SettingsDataModel> get settingsData => _settingsData.stream;

  void getSettingsData() {
    dataSourceImpl.getSliderData().then((value) {
      _settingsData.value = value;
      _settingsData.sink;
    });
  }
}

// ignore: non_constant_identifier_names
SettingsDataBloc settingsDataBloc = SettingsDataBloc();
