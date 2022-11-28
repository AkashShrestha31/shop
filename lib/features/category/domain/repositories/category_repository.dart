import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/category/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryModel>> categoryData(NoParams params);
}
