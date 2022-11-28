import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shoppos/core/error/failures.dart';
import 'package:shoppos/core/usecases/usecase.dart';
import 'package:shoppos/features/category/domain/usecases/category_screen.dart';
import 'package:shoppos/features/category/presentation/bloc/category_event.dart';
import 'package:shoppos/features/category/presentation/bloc/category_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryScreen getCategoryScreen;

  CategoryBloc({
    required GetCategoryScreen screen,
  })  : assert(screen != null),
        getCategoryScreen = screen,
        super(CategoryEmpty()) {
    on<GetCategoryData>(_onCategory);
  }

  Future<void> _onCategory(
    GetCategoryData event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final failureOrData = await getCategoryScreen(NoParams());
    print(failureOrData);
    emit(failureOrData.fold((failure) => CategoryError(message: _mapFailureToMessage(failure)), (data) => CategoryLoaded(model: data)));
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
