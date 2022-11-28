import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/attributes/data/datasources/attributes_remote_data_repository.dart';
import 'package:shoppos/features/attributes/data/models/attributes_model.dart';
import 'package:shoppos/features/attributes/domain/repositories/attributes_repository.dart';

class AttributesRepositoryImpl implements AttributesRepository {
  final AttributesDataSource attributesDataSource;

  AttributesRepositoryImpl({required this.attributesDataSource});

  @override
  Future<Either<Failure, AttributesModel>> attributesData(NoParams params) async {
    try {
      final localData = await attributesDataSource.AttributesData(params);
      return Right(localData);
    } on CacheException {
      throw Left(CacheException());
    }
  }
}
