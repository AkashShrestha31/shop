import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/features/add_products/data/datasources/productcreate_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/models/create_product_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcreate_repository.dart';

class ProductCreateRepositoryImpl implements ProductCreateRepository {
  final ProductCreateDataSource productCreateDataSource;

  ProductCreateRepositoryImpl({required this.productCreateDataSource});

  @override
  Future<Either<Failure, ResponseModel>> productCreate(ProductCreateModel params) async {
    try {
      final localData = await productCreateDataSource.ProductCreate(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> productUpdate(ProductCreateModel params) async {
    try {
      final localData = await productCreateDataSource.ProductCreate(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
