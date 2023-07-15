import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ten_app/product/data/repositories/repo_imp.dart';
import 'package:ten_app/product/domain/repositories/rep_book.dart';
import 'package:ten_app/product/domain/use_cases/get_now_book.dart';
import 'package:http/http.dart' as http;
import '../product/data/local/data_sources/local_data_sourse.dart';
import '../product/data/remote/data_sources/data_book.dart';
import '../product/domain/use_cases/get_book_use_case.dart';
import '../product/presentation/manager/book_cubit.dart';
import 'conncation_net.dart';

final sl = GetIt.instance;

   Future< void> init() async {
// bloc
  sl.registerFactory(() => BoolCubit(
        getBookUseCase: sl(),
      ));

// useCase
  sl.registerLazySingleton(() => GetBookUseCase(repoBooks: sl()));
  sl.registerLazySingleton(() => GetNowBookUseCase(repoBooks: sl()));
  sl.registerLazySingleton<RepoBooks>(
      () => RepImp(apiHelpersImp: sl(), forImp: sl(), localDataImp: sl() , ));
  sl.registerLazySingleton(() => InForImp(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker ());
  sl.registerLazySingleton(() => http.Client());
  sl.registerSingleton<ApiHelpers>(ApiHelpersImp(client: sl()));
 sl.registerLazySingleton(() => LocalData);
  sl.registerLazySingleton( () =>  LocalDataImp());

  sl.registerLazySingleton(() => ApiHelpersImp(client: sl()));
}
//نعرف bstrct class  لم يكون mp بداخله متغيرات

//
// BoolCubit(getBookUseCase: GetBookUseCase(
// repoBooks: RepImp(
// apiHelpersImp: ApiHelpersImp(client: http.Client()),
// forImp: InForImp(connectionChecker:  InternetConnectionChecker()),
// localDataImp: LocalDataImp()),
// ))