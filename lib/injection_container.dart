import 'package:get_it/get_it.dart';
import 'package:shoppos/features/add_products/data/datasources/productattribute_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/datasources/productbrand_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/datasources/productcategory_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/datasources/productcreate_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/datasources/productsubattribute_local_data_repository.dart';
import 'package:shoppos/features/add_products/data/repositories/productattribute_repository_impl.dart';
import 'package:shoppos/features/add_products/data/repositories/productbrand_repository_impl.dart';
import 'package:shoppos/features/add_products/data/repositories/productcategory_repository_impl.dart';
import 'package:shoppos/features/add_products/data/repositories/productcreate_repository_impl.dart';
import 'package:shoppos/features/add_products/data/repositories/productsubattribute_repository_impl.dart';
import 'package:shoppos/features/add_products/domain/repositories/productattribute_repository.dart';
import 'package:shoppos/features/add_products/domain/repositories/productbrand_repository.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcategory_repository.dart';
import 'package:shoppos/features/add_products/domain/repositories/productcreate_repository.dart';
import 'package:shoppos/features/add_products/domain/repositories/productsubattribute_repository.dart';
import 'package:shoppos/features/add_products/domain/usecases/productattribute_screen.dart';
import 'package:shoppos/features/add_products/domain/usecases/productbrand_screen.dart';
import 'package:shoppos/features/add_products/domain/usecases/productcategory_screen.dart';
import 'package:shoppos/features/add_products/domain/usecases/productcreate_screen.dart';
import 'package:shoppos/features/add_products/domain/usecases/productsubattribute_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_bloc.dart';
import 'package:shoppos/features/attributes/data/datasources/attributes_remote_data_repository.dart';
import 'package:shoppos/features/attributes/data/repositories/attributes_repository_impl.dart';
import 'package:shoppos/features/attributes/domain/repositories/attributes_repository.dart';
import 'package:shoppos/features/attributes/domain/usecases/attributes_screen.dart';
import 'package:shoppos/features/attributes/presentation/bloc/attributes_bloc.dart';
import 'package:shoppos/features/boarding_screen/data/datasources/boarding_screen_local_data_repository.dart';
import 'package:shoppos/features/boarding_screen/data/repositories/boarding_screen_repository_impl.dart';
import 'package:shoppos/features/boarding_screen/domain/repositories/boarding_screen_repository.dart';
import 'package:shoppos/features/boarding_screen/presentation/bloc/bloc.dart';
import 'package:shoppos/features/category/data/datasources/category_remote_data_repository.dart';
import 'package:shoppos/features/category/data/repositories/category_repository_impl.dart';
import 'package:shoppos/features/category/domain/repositories/category_repository.dart';
import 'package:shoppos/features/category/domain/usecases/category_screen.dart';
import 'package:shoppos/features/category/presentation/bloc/category_bloc.dart';
import 'package:shoppos/features/login_screen/data/datasources/login_local_data_repository.dart';
import 'package:shoppos/features/login_screen/data/repositories/login_repository_impl.dart';
import 'package:shoppos/features/login_screen/domain/repositories/login_repository.dart';
import 'package:shoppos/features/login_screen/domain/usecases/login_screen.dart';
import 'package:shoppos/features/login_screen/presentation/bloc/login_bloc.dart';
import 'package:shoppos/features/products/data/datasources/products_remote_data_repository.dart';
import 'package:shoppos/features/products/data/repositories/products_repository_impl.dart';
import 'package:shoppos/features/products/domain/repositories/products_repository.dart';
import 'package:shoppos/features/products/presentation/bloc/products_bloc.dart';
import 'package:shoppos/features/setting_items_description/data/datasources/service_remote_data_repository.dart';
import 'package:shoppos/features/setting_items_description/data/repositories/service_repository_impl.dart';
import 'package:shoppos/features/setting_items_description/domain/repositories/service_repository.dart';
import 'package:shoppos/features/setting_items_description/domain/usecases/service_screen.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_bloc.dart';
import 'package:shoppos/routes/app_router.gr.dart';

import 'features/boarding_screen/domain/usecases/get_boarding_screen.dart';
import 'features/products/domain/usecases/products_screen.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => BoardingScreenBloc(screen: sl()),
  );
  sl.registerFactory(
    () => LoginBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ServiceBloc(screen: sl()),
  );
  sl.registerFactory(
    () => CategoryBloc(screen: sl()),
  );
  sl.registerFactory(
    () => AttributesBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductsBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductAttributeBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductSubAttributeBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductCategoryBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductBrandBloc(screen: sl()),
  );
  sl.registerFactory(
    () => ProductCreateBloc(screen: sl()),
  );
  sl.registerFactory(
    () => GetDeleteProductsBloc(screen: sl()),
  );

  /// For Searching Products [GetSearchProductsBloc]
  sl.registerFactory(
    () => GetSearchProductsBloc(screen: sl()),
  );
  //Route
  sl.registerSingleton<AppRouter>(AppRouter());
  // Use cases
  sl.registerLazySingleton(() => GetBoardingScreen(sl()));
  sl.registerLazySingleton(() => GetLoginScreen(sl()));
  sl.registerLazySingleton(() => GetServiceScreen(sl()));
  sl.registerLazySingleton(() => GetCategoryScreen(sl()));
  sl.registerLazySingleton(() => GetAttributesScreen(sl()));
  sl.registerLazySingleton(() => GetProductsScreen(sl()));
  sl.registerLazySingleton(() => GetProductAttributeScreen(sl()));
  sl.registerLazySingleton(() => GetProductSubAttributeScreen(sl()));
  sl.registerLazySingleton(() => GetProductBrandScreen(sl()));
  sl.registerLazySingleton(() => GetProductCategoryScreen(sl()));
  sl.registerLazySingleton(() => GetProductCreateScreen(sl()));
  sl.registerLazySingleton(() => GetDeleteProductsScreen(sl()));
  sl.registerLazySingleton(() => GetProductsSearchScreen(sl()));
  // Repository
  sl.registerLazySingleton<BoardingScreenRepository>(
    () => BoardingScreenRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginDataSource: sl()),
  );
  sl.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(serviceDataSource: sl()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(categoryDataSource: sl()),
  );
  sl.registerLazySingleton<AttributesRepository>(
    () => AttributesRepositoryImpl(attributesDataSource: sl()),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(productsDataSource: sl()),
  );
  sl.registerLazySingleton<ProductAttributeRepository>(
    () => ProductAttributeRepositoryImpl(productAttributeDataSource: sl()),
  );
  sl.registerLazySingleton<ProductSubAttributeRepository>(
    () => ProductSubAttributeRepositoryImpl(productSubAttributeDataSource: sl()),
  );
  sl.registerLazySingleton<ProductBrandRepository>(
    () => ProductBrandRepositoryImpl(productBrandDataSource: sl()),
  );
  sl.registerLazySingleton<ProductCategoryRepository>(
    () => ProductCategoryRepositoryImpl(productCategoryDataSource: sl()),
  );
  sl.registerLazySingleton<ProductCreateRepository>(
    () => ProductCreateRepositoryImpl(productCreateDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<BoardingScreenLocalDataSource>(
    () => BoardingScreenLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(),
  );
  sl.registerLazySingleton<ServiceDataSource>(
    () => ServiceDataSourceImpl(),
  );
  sl.registerLazySingleton<CategoryDataSource>(
    () => CategoryDataSourceImpl(),
  );
  sl.registerLazySingleton<AttributesDataSource>(
    () => AttributesDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductAttributeDataSource>(
    () => ProductAttributeDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductSubAttributeDataSource>(
    () => ProductSubAttributeDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductCategoryDataSource>(
    () => ProductCategoryDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductBrandDataSource>(
    () => ProductBrandDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductCreateDataSource>(
    () => ProductCreateDataSourceImpl(),
  );
}
