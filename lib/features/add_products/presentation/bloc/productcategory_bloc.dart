import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/add_products/domain/usecases/productcategory_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final GetProductCategoryScreen getProductCategoryScreen;

  ProductCategoryBloc({
    required GetProductCategoryScreen screen,
  })  : assert(screen != null),
        getProductCategoryScreen = screen,
        super(ProductCategoryEmpty()) {
    on<GetProductCategoryData>(_onProductCategory);
  }

  Future<void> _onProductCategory(
    GetProductCategoryData event,
    Emitter<ProductCategoryState> emit,
  ) async {
    emit(ProductCategoryLoading());
    final failureOrData = await getProductCategoryScreen(NoParams());
    emit(failureOrData.fold((failure) => ProductCategoryError(message: _mapFailureToMessage(failure)), (data) => ProductCategoryLoaded(model: data)));
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
