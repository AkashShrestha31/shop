import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductBrandEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductBrandData extends ProductBrandEvent {}
