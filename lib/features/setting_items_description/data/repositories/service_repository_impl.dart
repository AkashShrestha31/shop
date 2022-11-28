import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/setting_items_description/data/datasources/service_remote_data_repository.dart';
import 'package:shoppos/features/setting_items_description/data/models/service_model.dart';
import 'package:shoppos/features/setting_items_description/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceDataSource serviceDataSource;

  ServiceRepositoryImpl({required this.serviceDataSource});

  @override
  Future<Either<Failure, ServiceModel>> serviceCharge(NoParams params) async {
    try {
      final localData = await serviceDataSource.ServiceCharge(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }
}
