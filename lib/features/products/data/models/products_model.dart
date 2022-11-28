class ProductsModel {
  Links? links;
  int? count;
  int? totalPages;
  List<Results>? results;

  ProductsModel({this.links, this.count, this.totalPages, this.results});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    count = json['count'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['count'] = this.count;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? next;
  String? previous;

  Links({this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class Results {
  int? id;
  int? categoryid;
  int? brandid;
  int? attributeid;
  String? categoryName;
  String? attribute;
  String? barcode;
  bool? status;
  String? thumbnail;
  String? brandName;
  String? productName;
  int? quantity;
  String? description;
  int? costPrice;
  int? sellingPrice;
  String? wholesaler;
  String? purchase;
  List<Variants>? variants;
  String? createdOn;
  String? updatedOn;
  String? createdBy;
  String? updatedBy;
  List<ProductImage>? productImage;

  Results(
      {this.id,
      this.categoryid,
      this.brandid,
      this.attributeid,
      this.categoryName,
      this.barcode,
      this.thumbnail,
      this.brandName,
      this.productName,
      this.status,
      this.quantity,
      this.description,
      this.costPrice,
      this.sellingPrice,
      this.wholesaler,
      this.purchase,
      this.variants,
      this.createdOn,
      this.updatedOn,
      this.createdBy,
      this.updatedBy,
      this.productImage});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryid = json['category_id'];
    brandid = json['brand_id'];
    attributeid = json['attribute_id'];
    categoryName = json['category_name'];
    barcode = json['barcode'];
    status = json['status'];
    thumbnail = json['thumbnail'];
    attribute = json['attribute_name'];
    brandName = json['brand_name'];
    productName = json['product_name'];
    quantity = json['quantity'];
    description = json['description'];
    costPrice = json['cost_price'];
    sellingPrice = json['selling_price'];
    wholesaler = json['wholesaler'];
    purchase = json['purchase'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryid;
    data['brand_id'] = this.brandid;
    data['attribute_id'] = this.attributeid;
    data['category_name'] = this.categoryName;
    data['barcode'] = this.barcode;
    data['status'] = this.status;
    data['thumbnail'] = this.thumbnail;
    data['attribute_name'] = this.attribute;
    data['brand_name'] = this.brandName;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['cost_price'] = this.costPrice;
    data['selling_price'] = this.sellingPrice;
    data['wholesaler'] = this.wholesaler;
    data['purchase'] = this.purchase;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    if (this.productImage != null) {
      data['product_image'] = this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  int? id;
  String? value;
  String? barcode;
  String? attribute;
  String? product;

  Variants({this.id, this.value, this.barcode, this.attribute, this.product});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    barcode = json['barcode'];
    attribute = json['attribute_name'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['barcode'] = this.barcode;
    data['attribute_name'] = this.attribute;
    data['product'] = this.product;
    return data;
  }
}

class ProductImage {
  int? id;
  String? image;

  ProductImage({this.id, this.image});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
