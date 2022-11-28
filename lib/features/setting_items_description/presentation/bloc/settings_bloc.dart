import 'package:rxdart/rxdart.dart';

class SettingsBloc {
  // ignore: close_sinks
  final BehaviorSubject<int> _screen = BehaviorSubject<int>();
  Stream<int> get screen => _screen.stream;

  void updateScreenStatus(int value) {
    _screen.value = value;
    _screen.sink;
  }

  int getDeleteStatus() {
    return _screen.value;
  }
}

// ignore: non_constant_identifier_names
SettingsBloc settingsBloc = SettingsBloc();
