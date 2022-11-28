import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/productsubattribute_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productsubattribute_repository.dart';

class GetProductSubAttributeScreen implements UseCase<ProductSubAttributeModel, Search> {
  final ProductSubAttributeRepository repository;
  GetProductSubAttributeScreen(this.repository);
  @override
  Future<Either<Failure, ProductSubAttributeModel>> call(Search params) async {
    return await repository.productSubAttribute(params);
  }
}
