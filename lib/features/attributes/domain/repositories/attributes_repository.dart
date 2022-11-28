import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/attributes/data/models/attributes_model.dart';

abstract class AttributesRepository {
  Future<Either<Failure, AttributesModel>> attributesData(NoParams params);
}
