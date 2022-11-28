import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/features/boarding_screen/data/datasources/boarding_screen_local_data_repository.dart';
import 'package:shoppos/features/boarding_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/boarding_screen/domain/repositories/boarding_screen_repository.dart';

class BoardingScreenRepositoryImpl implements BoardingScreenRepository {
  final BoardingScreenLocalDataSource localDataSource;

  BoardingScreenRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, ShowSliderModel>> getSliderData() async {
    // TODO: implement getSliderData
    try {
      final localData = await localDataSource.getSliderData();
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }
}
