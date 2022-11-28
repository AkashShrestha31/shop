class AttributesModel {
  Links? links;
  int? count;
  int? totalPages;
  List<Results>? results;

  AttributesModel({this.links, this.count, this.totalPages, this.results});

  AttributesModel.fromJson(Map<String, dynamic> json) {
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
  Null? next;
  Null? previous;

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
  String? attributeName;
  bool? status;
  String? createdOn;
  String? updatedOn;
  Null? createdBy;
  Null? updatedBy;

  Results({this.id, this.attributeName, this.status, this.createdOn, this.updatedOn, this.createdBy, this.updatedBy});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeName = json['attribute_name'];
    status = json['status'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_name'] = this.attributeName;
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
