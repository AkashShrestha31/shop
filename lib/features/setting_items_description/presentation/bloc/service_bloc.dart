import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/setting_items_description/domain/usecases/service_screen.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_event.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServiceScreen getServiceScreen;

  ServiceBloc({
    required GetServiceScreen screen,
  })  : assert(screen != null),
        getServiceScreen = screen,
        super(ServiceEmpty()) {
    on<GetServiceData>(_onService);
  }

  Future<void> _onService(
    GetServiceData event,
    Emitter<ServiceState> emit,
  ) async {
    emit(ServiceLoading());
    final failureOrData = await getServiceScreen(NoParams());
    print(failureOrData);
    emit(failureOrData.fold((failure) => ServiceError(message: _mapFailureToMessage(failure)), (data) => ServiceLoaded(model: data)));
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
