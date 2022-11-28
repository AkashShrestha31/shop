import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productsubattribute_model.dart';

abstract class ProductSubAttributeRepository {
  Future<Either<Failure, ProductSubAttributeModel>> productSubAttribute(Search params);
}
