import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';

import '../repositories/products_repository.dart';

class GetProductsScreen implements UseCase<ProductsModel, Page> {
  final ProductsRepository repository;
  GetProductsScreen(this.repository);
  @override
  Future<Either<Failure, ProductsModel>> call(Page params) async {
    return await repository.productsData(params);
  }
}

class GetProductsSearchScreen implements UseCase<ProductsModel, Search> {
  final ProductsRepository repository;
  GetProductsSearchScreen(this.repository);
  @override
  Future<Either<Failure, ProductsModel>> call(Search params) async {
    return await repository.productsSearch(params);
  }
}

class GetDeleteProductsScreen implements UseCase<ResponseModel, GetProductsDeleteData> {
  final ProductsRepository repository;
  GetDeleteProductsScreen(this.repository);
  @override
  Future<Either<Failure, ResponseModel>> call(GetProductsDeleteData params) async {
    return await repository.productsDelete(params);
  }
}
