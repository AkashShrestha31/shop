import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductSubAttributeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductSubAttributeData extends ProductSubAttributeEvent {
  final String search;
  GetProductSubAttributeData(this.search);

  @override
  List<Object> get props => [search];
}
