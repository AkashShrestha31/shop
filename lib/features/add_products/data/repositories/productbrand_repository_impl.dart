import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/datasources/productbrand_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/models/productbrand_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productbrand_repository.dart';

class ProductBrandRepositoryImpl implements ProductBrandRepository {
  final ProductBrandDataSource productBrandDataSource;

  ProductBrandRepositoryImpl({required this.productBrandDataSource});

  @override
  Future<Either<Failure, ProductBrandModel>> productBrand(NoParams params) async {
    try {
      final localData = await productBrandDataSource.ProductBrand(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
