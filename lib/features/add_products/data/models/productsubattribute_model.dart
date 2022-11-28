class ProductSubAttributeModel {
  List<Results>? results;

  ProductSubAttributeModel({this.results});

  ProductSubAttributeModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? value;
  String? barcode;
  bool? status;

  Results({this.id, this.value, this.barcode, this.status});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    barcode = json['barcode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['barcode'] = this.barcode;
    data['status'] = this.status;
    return data;
  }
}
