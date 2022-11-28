import 'package:rxdart/rxdart.dart';

class CheckBoxBloc {
  // ignore: close_sinks
  final BehaviorSubject<bool> _checked = BehaviorSubject<bool>();
  Stream<bool> get checked => _checked.stream;

  void updateChecked(bool value) {
    _checked.value = value;
    _checked.sink;
  }

  bool getChecked() {
    return _checked.value;
  }
}

// ignore: non_constant_identifier_names
CheckBoxBloc checkBoxBloc = CheckBoxBloc();
