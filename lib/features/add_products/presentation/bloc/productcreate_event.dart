import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductCreateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductCreateData extends ProductCreateEvent {
  File thumbnail_image;
  String productName;
  int cost_price;
  int quantity;
  int category;
  int brand;
  int attribute;
  String barcode;
  String description;
  List<dynamic> productImage;
  bool status;
  List<dynamic> subAttribute;

  GetProductCreateData(this.thumbnail_image, this.productName, this.cost_price, this.quantity, this.category, this.brand, this.attribute,
      this.barcode, this.description, this.productImage, this.status, this.subAttribute);
  @override
  List<Object> get props =>
      [thumbnail_image, productName, cost_price, quantity, category, brand, attribute, barcode, description, productImage, status, subAttribute];
}
