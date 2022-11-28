import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/model/response_model.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/data/models/create_product_model.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcreate_repository.dart';

class GetProductCreateScreen implements UseCase<ResponseModel, ProductCreateModel> {
  final ProductCreateRepository repository;
  GetProductCreateScreen(this.repository);
  @override
  Future<Either<Failure, ResponseModel>> call(ProductCreateModel params) async {
    return await repository.productUpdate(params);
  }
}
