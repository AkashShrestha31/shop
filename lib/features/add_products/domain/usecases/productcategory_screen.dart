import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productcategory_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcategory_repository.dart';

class GetProductCategoryScreen implements UseCase<ProductCategoryModel, NoParams> {
  final ProductCategoryRepository repository;
  GetProductCategoryScreen(this.repository);
  @override
  Future<Either<Failure, ProductCategoryModel>> call(NoParams params) async {
    return await repository.productCategory(params);
  }
}
