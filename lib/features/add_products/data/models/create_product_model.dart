import 'dart:io';

class ProductCreateModel {
  File? thumbnail_image;
  String? productName;
  int? cost_price;
  int? quantity;
  int? category;
  int? brand;
  int? attribute;
  String? barcode;
  String? description;
  List<dynamic>? productImage;
  bool? status;
  List<dynamic>? subAttribute;

  ProductCreateModel(
      {required this.thumbnail_image,
      required this.productName,
      required this.cost_price,
      required this.quantity,
      required this.category,
      required this.brand,
      required this.attribute,
      required this.barcode,
      required this.description,
      required this.productImage,
      required this.status,
      required this.subAttribute});
}
