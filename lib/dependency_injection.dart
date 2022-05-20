import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:megatech/presentation/blocs/authentication/sign_in_bloc.dart';

import 'package:megatech/presentation/blocs/date_time_picker/date_time_picker_bloc.dart';
import 'package:http/http.dart';
import 'package:megatech/presentation/blocs/session/session_bloc.dart';
import 'package:megatech/source/core/api_client.dart';
import 'package:megatech/source/data_source/local_data_source.dart';
import 'package:megatech/source/data_source/remote_data_source.dart';
import 'package:megatech/source/repository/sign_in_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {



  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerFactory<DateTimePickerBloc>(() => DateTimePickerBloc());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  sl.registerLazySingleton<IRemoteDataSource>(
      () => RemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<ILocalDataSource>(
      () => LocalDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton<ISignedInRepository>(() => SignedInRepository(
      localDataSource: sl(), remoteDataSource: sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(iSignedInRepository: sl()));
  sl.registerLazySingleton<SessionBloc>(() => SessionBloc(iSignedInRepository: sl()));
  ///external


}
