import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productbrand_model.dart';

abstract class ProductBrandRepository {
  Future<Either<Failure, ProductBrandModel>> productBrand(NoParams params);
}
