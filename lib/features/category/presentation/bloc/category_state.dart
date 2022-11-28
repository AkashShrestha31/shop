import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/category/data/models/category_model.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryEmpty extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel model;

  CategoryLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
