import 'package:rxdart/rxdart.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';

class ProductsCRUDBloc {
  // ignore: close_sinks
  final BehaviorSubject<Results> _deleteProduct = BehaviorSubject<Results>();
  Stream<Results> get deleteProduct => _deleteProduct.stream;

  final BehaviorSubject<List<Results>> _results = BehaviorSubject<List<Results>>();
  Stream<List<Results>> get results => _results.stream;

  final BehaviorSubject<int> _currentPage = BehaviorSubject<int>();
  Stream<int> get currentPage => _currentPage.stream;

  final BehaviorSubject<int> _totalPage = BehaviorSubject<int>();
  Stream<int> get totalPage => _totalPage.stream;

  void updateDeleteProduct(Results value) {
    _deleteProduct.value = value;
    _deleteProduct.sink;
  }

  void updateResults(List<Results> value) {
    _results.value = value;
    _results.sink;
  }

  void updateCurrentPage(int value) {
    _currentPage.value = value;
    _currentPage.sink;
  }

  void updateTotalPage(int value) {
    _totalPage.value = value;
    _totalPage.sink;
  }

  Results getDeleteProduct() {
    return _deleteProduct.value;
  }

  int getCurrentPage() {
    return _currentPage.value;
  }

  int getTotalPage() {
    return _totalPage.value;
  }

  void deleteResult(Results results) {
    _results.value.remove(results);
    _results.value = _results.value;
    _results.sink;
  }
}

// ignore: non_constant_identifier_names
ProductsCRUDBloc productsCRUDBloc = ProductsCRUDBloc();
