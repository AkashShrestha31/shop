import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/features/add_products/data/models/create_product_model.dart';
import 'package:shoppos/features/add_products/domain/usecases/productcreate_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProductCreateBloc extends Bloc<ProductCreateEvent, ProductCreateState> {
  final GetProductCreateScreen getProductCreateScreen;

  ProductCreateBloc({
    required GetProductCreateScreen screen,
  })  : assert(screen != null),
        getProductCreateScreen = screen,
        super(ProductCreateEmpty()) {
    on<GetProductCreateData>(_onProductCreate);
  }

  Future<void> _onProductCreate(
    GetProductCreateData event,
    Emitter<ProductCreateState> emit,
  ) async {
    emit(ProductCreateLoading());
    final failureOrData = await getProductCreateScreen(ProductCreateModel(
        thumbnail_image: event.thumbnail_image,
        productName: event.productName,
        cost_price: event.cost_price,
        quantity: event.quantity,
        category: event.category,
        brand: event.brand,
        attribute: event.attribute,
        barcode: event.barcode,
        description: event.description,
        productImage: event.productImage,
        status: event.status,
        subAttribute: event.subAttribute));
    emit(failureOrData.fold((failure) => ProductCreateError(message: _mapFailureToMessage(failure)), (data) => ProductCreateLoaded(model: data)));
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
