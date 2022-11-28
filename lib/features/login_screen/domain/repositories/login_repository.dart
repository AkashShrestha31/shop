import 'package:dartz/dartz.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/login_screen/data/models/show_slider_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(Params params);
}
