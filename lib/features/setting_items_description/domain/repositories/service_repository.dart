import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/setting_items_description/data/models/service_model.dart';

abstract class ServiceRepository {
  Future<Either<Failure, ServiceModel>> serviceCharge(NoParams params);
}
