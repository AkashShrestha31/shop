import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/datasources/productsubattribute_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/models/productsubattribute_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productsubattribute_repository.dart';

class ProductSubAttributeRepositoryImpl implements ProductSubAttributeRepository {
  final ProductSubAttributeDataSource productSubAttributeDataSource;

  ProductSubAttributeRepositoryImpl({required this.productSubAttributeDataSource});

  @override
  Future<Either<Failure, ProductSubAttributeModel>> productSubAttribute(Search params) async {
    try {
      final localData = await productSubAttributeDataSource.ProductSubAttribute(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
