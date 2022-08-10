import 'package:cleanarchmvvm/app/app_prefrences.dart';
import 'package:cleanarchmvvm/data/data_source/remote_data_source.dart';
import 'package:cleanarchmvvm/data/network/app_api.dart';
import 'package:cleanarchmvvm/data/network/dio_factory.dart';
import 'package:cleanarchmvvm/data/network/network_info.dart';
import 'package:cleanarchmvvm/data/repository/repository_impl.dart';
import 'package:cleanarchmvvm/domain/repositories/repository.dart';
import 'package:cleanarchmvvm/domain/usecase/forgot_password_usecase.dart';
import 'package:cleanarchmvvm/domain/usecase/login_usecase.dart';
import 'package:cleanarchmvvm/presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:cleanarchmvvm/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // Contains all generic dependencies

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // App prefs instance
  instance
      .registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));

  // Network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  // AppServiceClient instance
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // Remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // Repository instance
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  // Login dependencies
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  // Forgot password dependencies
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}
