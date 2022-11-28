import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/attributes/domain/usecases/attributes_screen.dart';
import 'package:shoppos/features/attributes/presentation/bloc/attributes_event.dart';
import 'package:shoppos/features/attributes/presentation/bloc/attributes_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class AttributesBloc extends Bloc<AttributesEvent, AttributesState> {
  final GetAttributesScreen getAttributesScreen;

  AttributesBloc({
    required GetAttributesScreen screen,
  })  : assert(screen != null),
        getAttributesScreen = screen,
        super(AttributesEmpty()) {
    on<GetAttributesData>(_onAttributes);
  }

  Future<void> _onAttributes(
    GetAttributesData event,
    Emitter<AttributesState> emit,
  ) async {
    emit(AttributesLoading());
    final failureOrData = await getAttributesScreen(NoParams());
    print(failureOrData);
    emit(failureOrData.fold((failure) => AttributesError(message: _mapFailureToMessage(failure)), (data) => AttributesLoaded(model: data)));
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
