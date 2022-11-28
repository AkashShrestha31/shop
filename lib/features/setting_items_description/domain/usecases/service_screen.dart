import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/setting_items_description/data/models/service_model.dart';

import '../repositories/service_repository.dart';

class GetServiceScreen implements UseCase<ServiceModel, NoParams> {
  final ServiceRepository repository;
  GetServiceScreen(this.repository);
  @override
  Future<Either<Failure, ServiceModel>> call(NoParams params) async {
    return await repository.serviceCharge(params);
  }
}
