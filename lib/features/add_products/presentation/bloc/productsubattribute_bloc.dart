import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/domain/usecases/productsubattribute_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductSubAttributeBloc extends Bloc<ProductSubAttributeEvent, ProductSubAttributeState> {
  final GetProductSubAttributeScreen getProductSubAttributeScreen;

  ProductSubAttributeBloc({
    required GetProductSubAttributeScreen screen,
  })  : assert(screen != null),
        getProductSubAttributeScreen = screen,
        super(ProductSubAttributeEmpty()) {
    on<GetProductSubAttributeData>(_onProductSubAttribute);
  }

  Future<void> _onProductSubAttribute(
    GetProductSubAttributeData event,
    Emitter<ProductSubAttributeState> emit,
  ) async {
    emit(ProductSubAttributeLoading());
    final failureOrData = await getProductSubAttributeScreen(Search(search: event.search));
    emit(failureOrData.fold(
        (failure) => ProductSubAttributeError(message: _mapFailureToMessage(failure)), (data) => ProductSubAttributeLoaded(model: data)));
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
