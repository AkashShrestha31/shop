class ProductAttributeModel {
  List<Results>? results;

  ProductAttributeModel({this.results});

  ProductAttributeModel.fromJson(Map<String, dynamic> json) {
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
  String? attributeName;

  Results({this.id, this.attributeName});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeName = json['attribute_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_name'] = this.attributeName;
    return data;
  }
}
