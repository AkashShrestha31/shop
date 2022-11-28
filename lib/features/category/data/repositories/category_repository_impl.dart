import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/category/data/datasources/category_remote_data_repository.dart';
import 'package:shoppos/features/category/data/models/category_model.dart';
import 'package:shoppos/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({required this.categoryDataSource});

  @override
  Future<Either<Failure, CategoryModel>> categoryData(NoParams params) async {
    try {
      final localData = await categoryDataSource.CategoryData(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }
}
