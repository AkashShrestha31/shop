import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/add_products/data/models/productattribute_model.dart';

@immutable
abstract class ProductAttributeState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductAttributeEmpty extends ProductAttributeState {}

class ProductAttributeLoading extends ProductAttributeState {}

class ProductAttributeLoaded extends ProductAttributeState {
  final ProductAttributeModel model;

  ProductAttributeLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductAttributeError extends ProductAttributeState {
  final String message;

  ProductAttributeError({required this.message});

  @override
  List<Object> get props => [message];
}
