import 'package:rxdart/rxdart.dart';

class SortByBloc {
  // ignore: close_sinks
  final BehaviorSubject<int> _sort = BehaviorSubject<int>();
  Stream<int> get sort => _sort.stream;
  void intSort() {
    _sort.value = 0;
    _sort.sink;
  }

  void updateSort(int value) {
    _sort.value = value;
    _sort.sink;
  }

  int getSort() {
    return _sort.value;
  }
}

// ignore: non_constant_identifier_names
SortByBloc sortByBloc = SortByBloc();
