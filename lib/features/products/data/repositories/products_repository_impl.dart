import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/products/data/datasources/products_remote_data_repository.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/domain/repositories/products_repository.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource productsDataSource;

  ProductsRepositoryImpl({required this.productsDataSource});

  @override
  Future<Either<Failure, ProductsModel>> productsData(Page params) async {
    try {
      final localData = await productsDataSource.ProductsData(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> productsDelete(GetProductsDeleteData params) async {
    // TODO: implement productsDelete
    try {
      final localData = await productsDataSource.ProductsDelete(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> productsSearch(Search params) async {
    // TODO: implement productsDelete
    try {
      final localData = await productsDataSource.ProductsSearch(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }
}
