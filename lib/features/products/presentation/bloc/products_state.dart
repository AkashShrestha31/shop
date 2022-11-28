import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsEmpty extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final ProductsModel model;

  ProductsLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductsDeleteLoaded extends ProductsState {
  final ResponseModel model;

  ProductsDeleteLoaded({required this.model});

  @override
  List<Object> get props => [model];
}
