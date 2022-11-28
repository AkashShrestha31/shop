import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCategoryData extends CategoryEvent {}
