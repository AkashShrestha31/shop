class ServiceModel {
  Links? links;
  int? count;
  int? totalPages;
  List<Results>? results;

  ServiceModel({this.links, this.count, this.totalPages, this.results});

  ServiceModel.fromJson(Map<String, dynamic> json) {
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
  int? charge;
  String? chargeType;
  String? selection;
  int? rate;
  bool? isDelete;
  String? createdOn;
  String? order;
  String? service;

  Results({this.id, this.charge, this.chargeType, this.selection, this.rate, this.isDelete, this.createdOn, this.order, this.service});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    charge = json['charge'];
    chargeType = json['charge_type'];
    selection = json['selection'];
    rate = json['rate'];
    isDelete = json['is_delete'];
    createdOn = json['created_on'];
    order = json['order'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['charge'] = this.charge;
    data['charge_type'] = this.chargeType;
    data['selection'] = this.selection;
    data['rate'] = this.rate;
    data['is_delete'] = this.isDelete;
    data['created_on'] = this.createdOn;
    data['order'] = this.order;
    data['service'] = this.service;
    return data;
  }
}
