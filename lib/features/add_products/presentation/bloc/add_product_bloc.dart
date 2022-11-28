import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';

class Data {
  int? id;
  String? name;

  Data({this.id, this.name});
}

class AddProductBloc {
  // ignore: close_sinks
  final BehaviorSubject<File> _thumbnailImage = BehaviorSubject<File>();
  Stream<File> get thumbnailImage => _thumbnailImage.stream;

  final BehaviorSubject<String> _thumbnailImageLink = BehaviorSubject<String>();
  Stream<String> get thumbnailImageLink => _thumbnailImageLink.stream;

  final BehaviorSubject<String> _status = BehaviorSubject<String>();
  Stream<String> get status => _status.stream;

  final BehaviorSubject<List<dynamic>> _multipleImage = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get multipleImage => _multipleImage.stream;

  final BehaviorSubject<Data> _selectAttribute = BehaviorSubject<Data>();
  Stream<Data> get selectAttribute => _selectAttribute.stream;

  final BehaviorSubject<List<int>> _selectSubAttribute = BehaviorSubject<List<int>>();
  Stream<List<int>> get selectSubAttribute => _selectSubAttribute.stream;

  final BehaviorSubject<Data> _selectBrand = BehaviorSubject<Data>();
  Stream<Data> get selectBrand => _selectBrand.stream;

  final BehaviorSubject<Data> _selectCategory = BehaviorSubject<Data>();
  Stream<Data> get selectCategory => _selectCategory.stream;

  final BehaviorSubject<String> _productName = BehaviorSubject<String>();
  Stream<String> get productName => _productName.stream;

  final BehaviorSubject<String> _quantity = BehaviorSubject<String>();
  Stream<String> get quantity => _quantity.stream;

  final BehaviorSubject<String> _cost = BehaviorSubject<String>();
  Stream<String> get cost => _cost.stream;

  final BehaviorSubject<String> _description = BehaviorSubject<String>();
  Stream<String> get description => _description.stream;

  List<dynamic> _list = [];
  List<ProductImage> _listLink = [];
  List<int> _subAttributelist = [];
  // ignore: non_constant_identifier_names
  void updateSelectSubAtribute(int index) {
    _subAttributelist.add(index);
    _selectSubAttribute.sink.add(_subAttributelist);
  }

  void removeSelectSubAtribute(int index) {
    _subAttributelist.remove(index);
    _selectSubAttribute.sink.add(_subAttributelist);
  }

  void updateSelectBrand(Data brand) {
    _selectBrand.value = brand;
    _selectBrand.sink;
  }

  void updateSelectCategory(Data category) {
    _selectCategory.value = category;
    _selectCategory.sink;
  }

  void updateSelectAtribute(Data attribute) {
    _selectAttribute.value = attribute;
    _selectAttribute.sink;
  }

  void updateThumbnailImage(File file) {
    _thumbnailImage.value = file;
    _thumbnailImage.sink;
  }

  void updateThumbnailImageLink(String file) {
    _thumbnailImageLink.value = file;
    _thumbnailImageLink.sink;
  }

  void updateStatus(String status) {
    _status.value = status;
    _status.sink;
  }

  void updateProductName(String product) {
    _productName.value = product;
    _productName.sink;
  }

  void updateQuantity(String quantity) {
    _quantity.value = quantity;
    _quantity.sink;
  }

  void updateCost(String cost) {
    _cost.value = cost;
    _cost.sink;
  }

  void updateDescription(String description) {
    _description.value = description;
    _description.sink;
  }

  void updateMultipleImage(dynamic file) {
    _list.add(file);
    _multipleImage.sink.add(_list);
  }

  File getImage() {
    return _thumbnailImage.value;
  }

  String getImageLink() {
    return _thumbnailImageLink.value;
  }

  bool getImageHasValue() {
    return _thumbnailImage.hasValue;
  }

  bool getCategoryHasValue() {
    return _selectCategory.hasValue;
  }

  bool getBrandHasValue() {
    return _selectBrand.hasValue;
  }

  bool getAttributeHasValue() {
    return _selectAttribute.hasValue;
  }

  bool getStatusHasValue() {
    return _status.hasValue;
  }

  bool getMultipleImageHasValue() {
    return _multipleImage.hasValue;
  }

  String getStatus() {
    return _status.value;
  }

  List<dynamic> getMultipleImage() {
    return _multipleImage.value;
  }

  Data getSelectedAttribute() {
    return _selectAttribute.value;
  }

  List<int> getSelectedSubAttribute() {
    return _selectSubAttribute.value;
  }

  Data getSelectedBrand() {
    return _selectBrand.value;
  }

  Data getSelectedCategory() {
    return _selectCategory.value;
  }

  String getProductName() {
    return _productName.value;
  }

  String getQuantity() {
    return _quantity.value;
  }

  String getCost() {
    return _cost.value;
  }

  String getDescription() {
    return _description.value;
  }

  void disposeFile() {
    _selectSubAttribute.value = [];
    _selectSubAttribute.sink;
    _selectAttribute.value = Data();
    _selectAttribute.sink;
    _subAttributelist = [];
    _list = [];
    _multipleImage.sink.add(_list);
    _selectSubAttribute.sink.add(_subAttributelist);
    _selectBrand.value = Data();
    _selectBrand.sink;
    _selectCategory.value = Data(name: null, id: null);
    _selectCategory.sink;
    _productName.value = "";
    _productName.sink;
    _quantity.value = "";
    _quantity.sink;
    _cost.value = "";
    _cost.sink;
    _description.value = "";
    _description.sink;

    _status.value = "";
    _status.sink;
    _thumbnailImage.value = File("empty");
    _thumbnailImage.sink;

    _thumbnailImageLink.value = "";
    _thumbnailImageLink.sink;
  }
}

// ignore: non_constant_identifier_names
AddProductBloc addProductBloc = AddProductBloc();
