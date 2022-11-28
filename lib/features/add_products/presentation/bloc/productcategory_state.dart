import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/add_products/data/models/productcategory_model.dart';

@immutable
abstract class ProductCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductCategoryEmpty extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryLoaded extends ProductCategoryState {
  final ProductCategoryModel model;

  ProductCategoryLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductCategoryError extends ProductCategoryState {
  final String message;

  ProductCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
