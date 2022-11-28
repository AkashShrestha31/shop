import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/products/domain/usecases/products_screen.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';
import 'package:shoppos/features/products/presentation/bloc/products_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsScreen getProductsScreen;

  ProductsBloc({
    required GetProductsScreen screen,
  })  : assert(screen != null),
        getProductsScreen = screen,
        super(ProductsEmpty()) {
    on<GetProductsData>(_onProducts);
  }

  Future<void> _onProducts(
    GetProductsData event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final failureOrData = await getProductsScreen(Page(page: event.page));
    print(failureOrData);
    emit(failureOrData.fold((failure) => ProductsError(message: _mapFailureToMessage(failure)), (data) => ProductsLoaded(model: data)));
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

class GetDeleteProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetDeleteProductsScreen getProductsScreen;

  GetDeleteProductsBloc({
    required GetDeleteProductsScreen screen,
  })  : assert(screen != null),
        getProductsScreen = screen,
        super(ProductsEmpty()) {
    on<GetProductsDeleteData>(_onProductsDelete);
  }

  Future<void> _onProductsDelete(
    GetProductsDeleteData event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final failureOrData = await getProductsScreen(GetProductsDeleteData(event.id));
    emit(failureOrData.fold((failure) => ProductsError(message: _mapFailureToMessage(failure)), (data) => ProductsDeleteLoaded(model: data)));
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

class GetSearchProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsSearchScreen getProductsSearchScreen;

  GetSearchProductsBloc({
    required GetProductsSearchScreen screen,
  })  : assert(screen != null),
        getProductsSearchScreen = screen,
        super(ProductsEmpty()) {
    on<GetProductsSearchData>(_onProductsSearch);
  }

  Future<void> _onProductsSearch(
    GetProductsSearchData event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final failureOrData = await getProductsSearchScreen(Search(search: event.search));
    emit(failureOrData.fold((failure) => ProductsError(message: _mapFailureToMessage(failure)), (data) => ProductsLoaded(model: data)));
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
