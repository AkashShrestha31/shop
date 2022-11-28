import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/datasources/productattribute_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/models/productattribute_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productattribute_repository.dart';

class ProductAttributeRepositoryImpl implements ProductAttributeRepository {
  final ProductAttributeDataSource productAttributeDataSource;

  ProductAttributeRepositoryImpl({required this.productAttributeDataSource});

  @override
  Future<Either<Failure, ProductAttributeModel>> productAttribute(NoParams params) async {
    try {
      final localData = await productAttributeDataSource.ProductAttribute(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
