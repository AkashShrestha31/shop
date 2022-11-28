class CategoryModel {
  Links? links;
  int? count;
  int? totalPages;
  List<Results>? results;

  CategoryModel({this.links, this.count, this.totalPages, this.results});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryName;
  String? icon;
  bool? status;

  Results({this.id, this.categoryName, this.icon, this.status});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['icon'] = this.icon;
    data['status'] = this.status;
    return data;
  }
}
