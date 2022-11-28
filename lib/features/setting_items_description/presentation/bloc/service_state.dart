import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/setting_items_description/data/models/service_model.dart';

@immutable
abstract class ServiceState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceEmpty extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final ServiceModel model;

  ServiceLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ServiceError extends ServiceState {
  final String message;

  ServiceError({required this.message});

  @override
  List<Object> get props => [message];
}
