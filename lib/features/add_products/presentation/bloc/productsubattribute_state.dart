import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/add_products/data/models/productsubattribute_model.dart';

@immutable
abstract class ProductSubAttributeState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductSubAttributeEmpty extends ProductSubAttributeState {}

class ProductSubAttributeLoading extends ProductSubAttributeState {}

class ProductSubAttributeLoaded extends ProductSubAttributeState {
  final ProductSubAttributeModel model;

  ProductSubAttributeLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductSubAttributeError extends ProductSubAttributeState {
  final String message;

  ProductSubAttributeError({required this.message});

  @override
  List<Object> get props => [message];
}
