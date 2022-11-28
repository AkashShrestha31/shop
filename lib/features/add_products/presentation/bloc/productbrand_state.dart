import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/add_products/data/models/productbrand_model.dart';

@immutable
abstract class ProductBrandState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductBrandEmpty extends ProductBrandState {}

class ProductBrandLoading extends ProductBrandState {}

class ProductBrandLoaded extends ProductBrandState {
  final ProductBrandModel model;

  ProductBrandLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductBrandError extends ProductBrandState {
  final String message;

  ProductBrandError({required this.message});

  @override
  List<Object> get props => [message];
}
