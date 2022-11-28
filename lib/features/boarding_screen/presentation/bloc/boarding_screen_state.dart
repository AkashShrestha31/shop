import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';

@immutable
abstract class BoardingScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends BoardingScreenState {}

class Loading extends BoardingScreenState {}

class Loaded extends BoardingScreenState {
  final ShowSliderModel model;

  Loaded({required this.model});

  @override
  List<Object> get props => [model];
}

class Error extends BoardingScreenState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
