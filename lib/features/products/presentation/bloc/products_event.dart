import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductsData extends ProductsEvent {
  final int page;

  GetProductsData(this.page);

  @override
  List<Object> get props => [page];
}

class GetProductsDeleteData extends ProductsEvent {
  final int id;

  GetProductsDeleteData(this.id);

  @override
  List<Object> get props => [id];
}

class GetProductsSearchData extends ProductsEvent {
  final String search;

  GetProductsSearchData(this.search);

  @override
  List<Object> get props => [search];
}
