import 'package:rxdart/rxdart.dart';

class HomeNavigationBloc {
  // ignore: close_sinks
  final BehaviorSubject<int> _currentPage = BehaviorSubject<int>();
  Stream<int> get currentPage => _currentPage.stream;

  void intCurrentPage() {
    _currentPage.value = 0;
    _currentPage.sink;
  }

  void updateCurrentPage(int value) {
    _currentPage.value = value;
    _currentPage.sink;
  }

  int getCurrentPage() {
    return _currentPage.value;
  }
}

// ignore: non_constant_identifier_names
HomeNavigationBloc homeNavigationBloc = HomeNavigationBloc();
