import 'package:e_commerce_app/features/auth/presentation/bloc/log_in/log_in_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/auth/data/datasource/auth_remote_data_impl.dart';
import 'features/auth/data/datasource/auth_remote_datasource.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/domain/usecases/log_in_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

import 'features/homepage/data/datasources/c_remote_datasouce_impl.dart';
import 'features/homepage/data/datasources/c_remote_datasource.dart';
import 'features/homepage/data/repository/c_repository.dart';
import 'features/homepage/domain/repository/category_repository.dart';
import 'features/homepage/domain/usecases/category_usecase.dart';
import 'features/homepage/presentation/bloc/category_bloc.dart';

import 'features/product/data/datasource/p_remote_datasource_impl.dart';
import 'features/product/data/datasource/product_remote_datasource.dart';
import 'features/product/data/repository/p_repo_impl.dart';
import 'features/product/domain/repository/product_repo.dart';
import 'features/product/domain/usecases/product_usecase.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final di = GetIt.instance;

void setupServiceLocator() {
  // External
  di.registerLazySingleton<Dio>(() => Dio());

  // DATA SOURCES
  di.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(dio: di()),
  );

  di.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(dio: di()),
  );

  di.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: di()),
  );

  // REPOSITORIES
  di.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(remoteDataSource: di()),
  );

  di.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(remoteDataSource: di()),
  );

  di.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: di()),
  );

  // USE CASES
  di.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(di()),
  );

  di.registerLazySingleton<RegisterUserUseCase>(
        () => RegisterUserUseCase(di()),
  );

  di.registerLazySingleton<LoginUserUseCase>(
        () => LoginUserUseCase(di()),
  );

  di.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(di()),
  );

  // BLOCS
  di.registerLazySingleton<CategoryBloc>(() => CategoryBloc(di()));

  di.registerFactory(() => AuthBloc(
    registerUserUseCase: di(),
  ));

  di.registerLazySingleton<ProductBloc>(() => ProductBloc(di()));

  di.registerLazySingleton<LoginBloc>(() => LoginBloc(loginUserUseCase: di()));
}
