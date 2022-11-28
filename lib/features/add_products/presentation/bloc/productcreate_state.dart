import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/core/model/response_model.dart';

@immutable
abstract class ProductCreateState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductCreateEmpty extends ProductCreateState {}

class ProductCreateLoading extends ProductCreateState {}

class ProductCreateLoaded extends ProductCreateState {
  final ResponseModel model;

  ProductCreateLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ProductCreateError extends ProductCreateState {
  final String message;

  ProductCreateError({required this.message});

  @override
  List<Object> get props => [message];
}
