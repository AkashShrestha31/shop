import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/features/add_products/data/models/create_product_model.dart';

abstract class ProductCreateRepository {
  Future<Either<Failure, ResponseModel>> productCreate(ProductCreateModel params);
  Future<Either<Failure, ResponseModel>> productUpdate(ProductCreateModel params);
}
