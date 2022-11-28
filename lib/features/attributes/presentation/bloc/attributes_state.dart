import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/attributes/data/models/attributes_model.dart';

@immutable
abstract class AttributesState extends Equatable {
  @override
  List<Object> get props => [];
}

class AttributesEmpty extends AttributesState {}

class AttributesLoading extends AttributesState {}

class AttributesLoaded extends AttributesState {
  final AttributesModel model;

  AttributesLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class AttributesError extends AttributesState {
  final String message;

  AttributesError({required this.message});

  @override
  List<Object> get props => [message];
}
