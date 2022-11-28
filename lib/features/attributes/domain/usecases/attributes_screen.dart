import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/attributes/data/models/attributes_model.dart';

import '../repositories/attributes_repository.dart';

class GetAttributesScreen implements UseCase<AttributesModel, NoParams> {
  final AttributesRepository repository;
  GetAttributesScreen(this.repository);
  @override
  Future<Either<Failure, AttributesModel>> call(NoParams params) async {
    return await repository.attributesData(params);
  }
}
