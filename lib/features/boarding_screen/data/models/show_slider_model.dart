import 'package:equatable/equatable.dart';

class ShowSliderModel extends Equatable {
  List<Items>? items;

  ShowSliderModel({this.items});

  ShowSliderModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class Items extends Equatable {
  String? title;
  String? description;
  String? image;

  Items({this.title, this.description, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, image];
}
