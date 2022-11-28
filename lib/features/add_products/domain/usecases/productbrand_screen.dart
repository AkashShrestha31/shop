import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productbrand_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productbrand_repository.dart';

class GetProductBrandScreen implements UseCase<ProductBrandModel, NoParams> {
  final ProductBrandRepository repository;
  GetProductBrandScreen(this.repository);
  @override
  Future<Either<Failure, ProductBrandModel>> call(NoParams params) async {
    return await repository.productBrand(params);
  }
}
