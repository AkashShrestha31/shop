import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/boarding_screen/domain/usecases/get_boarding_screen.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
class BoardingScreenBloc extends Bloc<BoardingScreenEvent, BoardingScreenState> {
  final GetBoardingScreen getBoardingcreen;

  BoardingScreenBloc({
    required GetBoardingScreen screen,
  })  : assert(screen != null),
        getBoardingcreen = screen,
        super(Empty()) {
    on<GetBoardingScreenData>(_onGetAllCategories);
  }

  Future<void> _onGetAllCategories(
    GetBoardingScreenData event,
    Emitter<BoardingScreenState> emit,
  ) async {
    emit(Loading());
    final failureOrData = await getBoardingcreen(NoParams());
    emit(failureOrData.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (data) => Loaded(model: data),
    ));
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
