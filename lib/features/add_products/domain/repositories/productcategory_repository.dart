import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productcategory_model.dart';

abstract class ProductCategoryRepository {
  Future<Either<Failure, ProductCategoryModel>> productCategory(NoParams params);
}
