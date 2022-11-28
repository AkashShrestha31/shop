import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/login_screen/data/models/show_slider_model.dart';

import '../repositories/login_repository.dart';

class GetLoginScreen implements UseCase<LoginModel, Params> {
  final LoginRepository repository;
  GetLoginScreen(this.repository);
  @override
  Future<Either<Failure, LoginModel>> call(Params params) async {
    return await repository.login(params);
  }
}
