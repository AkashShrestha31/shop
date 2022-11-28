import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/domain/usecases/productattribute_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductAttributeBloc extends Bloc<ProductAttributeEvent, ProductAttributeState> {
  final GetProductAttributeScreen getProductAttributeScreen;

  ProductAttributeBloc({
    required GetProductAttributeScreen screen,
  })  : assert(screen != null),
        getProductAttributeScreen = screen,
        super(ProductAttributeEmpty()) {
    on<GetProductAttributeData>(_onProductAttribute);
  }

  Future<void> _onProductAttribute(
    GetProductAttributeData event,
    Emitter<ProductAttributeState> emit,
  ) async {
    emit(ProductAttributeLoading());
    final failureOrData = await getProductAttributeScreen(NoParams());
    emit(failureOrData.fold(
        (failure) => ProductAttributeError(message: _mapFailureToMessage(failure)), (data) => ProductAttributeLoaded(model: data)));
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
