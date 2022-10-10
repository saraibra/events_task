
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/features/events/data/data_source/remote_datasource/get_all_events_datasource.dart';
import 'package:task_app/features/events/data/repositories/events_repository_imp.dart';
import 'package:task_app/features/events/domain/repositories/events_repository.dart';
import 'package:task_app/features/events/domain/use_cases/get_all_events_usecase.dart';
import 'package:task_app/features/events/presentation/bloc/events_bloc.dart';

import 'network/network_info.dart';


final sl = GetIt.instance;
Future<void> init() async {
  //*  features events
  // bloc
  sl.registerFactory(() => EventsBloc( sl()));
  // usecases
  sl.registerLazySingleton<GetAllEventsUseCase>(() => GetAllEventsUseCase(sl()));

  // repositories
  sl.registerLazySingleton<EventsReporsitory>(() => EventRepositoryImp(sl(),
    sl()));
  // datasources
 sl.registerLazySingleton<EventsRemoteDataSource>(() => EventsRemoteDataSourceImplement(client: sl()));
  

  //* core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(sl()));
  //* external
  final sharedPreference =await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
