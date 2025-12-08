import 'package:crm/Core/network/api_service.dart';
import 'package:crm/Core/network/dio_factory.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/auth/login/data/repos/login_repo.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/developers/data/repo/developers_repo.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  Dio dio = DioFactory.getDioInstance();
  getIt.registerLazySingleton(() => ApiService(dio));
  // login
  getIt.registerLazySingleton(() => LoginRepo(apiService: getIt()));
  getIt.registerFactory(() => LoginCubit(loginRepo: getIt()));
  getIt.registerLazySingleton(() => ProjectsRepo(apiService: getIt()));

  getIt.registerFactory(() => ProjectCubit(projectsRepo: getIt()));
  getIt.registerLazySingleton(() => DevelopersRepo(apiService: getIt()));
  getIt.registerFactory(() => DeveloperCubit(developersRepo: getIt()));
}
