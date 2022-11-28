import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';

abstract class BoardingScreenRepository {
  Future<Either<Failure, ShowSliderModel>> getSliderData();
}
