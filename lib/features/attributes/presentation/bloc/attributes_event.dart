import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AttributesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAttributesData extends AttributesEvent {}
