import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/login_screen/domain/usecases/login_screen.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_event.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginScreen getLoginScreen;

  LoginBloc({
    required GetLoginScreen screen,
  })  : assert(screen != null),
        getLoginScreen = screen,
        super(LoginEmpty()) {
    on<GetLoginData>(_onLogin);
  }

  Future<void> _onLogin(
    GetLoginData event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final failureOrData = await getLoginScreen(Params(username: event.username, password: event.password));
    print("fafajflafja $failureOrData");
    emit(failureOrData.fold((failure) => LoginError(message: _mapFailureToMessage(failure)), (data) => LoginLoaded(model: data)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
