import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productattribute_model.dart';

import '../repositories/productattribute_repository.dart';

class GetProductAttributeScreen implements UseCase<ProductAttributeModel, NoParams> {
  final ProductAttributeRepository repository;
  GetProductAttributeScreen(this.repository);
  @override
  Future<Either<Failure, ProductAttributeModel>> call(NoParams params) async {
    return await repository.productAttribute(params);
  }
}
