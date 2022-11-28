import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productattribute_model.dart';

abstract class ProductAttributeRepository {
  Future<Either<Failure, ProductAttributeModel>> productAttribute(NoParams params);
}
