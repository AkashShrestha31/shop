import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductCategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductCategoryData extends ProductCategoryEvent {}
