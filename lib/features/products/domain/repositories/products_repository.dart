import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductsModel>> productsData(Page params);
  Future<Either<Failure, ResponseModel>> productsDelete(GetProductsDeleteData params);
  Future<Either<Failure, ProductsModel>> productsSearch(Search params);
}
