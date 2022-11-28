import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/datasources/productcategory_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/models/productcategory_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcategory_repository.dart';

class ProductCategoryRepositoryImpl implements ProductCategoryRepository {
  final ProductCategoryDataSource productCategoryDataSource;

  ProductCategoryRepositoryImpl({required this.productCategoryDataSource});

  @override
  Future<Either<Failure, ProductCategoryModel>> productCategory(NoParams params) async {
    try {
      final localData = await productCategoryDataSource.ProductCategory(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
