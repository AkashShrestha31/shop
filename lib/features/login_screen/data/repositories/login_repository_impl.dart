import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/exceptions.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/login_screen/data/datasources/login_local_data_repository.dart';
import 'package:shoppos/features/login_screen/data/models/show_slider_model.dart';
import 'package:shoppos/features/login_screen/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, LoginModel>> login(Params params) async {
    try {
      final localData = await loginDataSource.Login(params);
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
