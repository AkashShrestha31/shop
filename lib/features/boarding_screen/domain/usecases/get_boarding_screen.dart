import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';

import '../repositories/boarding_screen_repository.dart';

class GetBoardingScreen implements UseCase<ShowSliderModel, NoParams> {
  final BoardingScreenRepository repository;
  GetBoardingScreen(this.repository);
  @override
  Future<Either<Failure, ShowSliderModel>> call(NoParams params) async {
    return await repository.getSliderData();
  }
}
