import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/domain/usecases/productbrand_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductBrandBloc extends Bloc<ProductBrandEvent, ProductBrandState> {
  final GetProductBrandScreen getProductBrandScreen;

  ProductBrandBloc({
    required GetProductBrandScreen screen,
  })  : assert(screen != null),
        getProductBrandScreen = screen,
        super(ProductBrandEmpty()) {
    on<GetProductBrandData>(_onProductBrand);
  }

  Future<void> _onProductBrand(
    GetProductBrandData event,
    Emitter<ProductBrandState> emit,
  ) async {
    emit(ProductBrandLoading());
    final failureOrData = await getProductBrandScreen(NoParams());
    emit(failureOrData.fold((failure) => ProductBrandError(message: _mapFailureToMessage(failure)), (data) => ProductBrandLoaded(model: data)));
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
