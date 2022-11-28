import 'package:rxdart/rxdart.dart';

class AddSettingsItemsBloc {
  // ignore: close_sinks
  final BehaviorSubject<int> _selectType = BehaviorSubject<int>();
  Stream<int> get selectType => _selectType.stream;

  void updateTypeStatus(int value) {
    _selectType.value = value;
    _selectType.sink;
  }

  int getType() {
    return _selectType.value;
  }
}

// ignore: non_constant_identifier_names
AddSettingsItemsBloc addSettingsItemsBloc = AddSettingsItemsBloc();
