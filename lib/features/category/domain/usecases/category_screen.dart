import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/category/data/models/category_model.dart';

import '../repositories/category_repository.dart';

class GetCategoryScreen implements UseCase<CategoryModel, NoParams> {
  final CategoryRepository repository;
  GetCategoryScreen(this.repository);
  @override
  Future<Either<Failure, CategoryModel>> call(NoParams params) async {
    return await repository.categoryData(params);
  }
}
