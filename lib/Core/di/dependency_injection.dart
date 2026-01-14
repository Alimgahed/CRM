import 'package:crm/Core/network/api_services.dart';
import 'package:crm/Core/network/dio_factory.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/actions/logic/add_client.dart';
import 'package:crm/features/auth/login/data/repos/login_repo.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/clients/data/repo/all_clients.dart';
import 'package:crm/features/clients/logic/cubit/leads_cubit.dart';
import 'package:crm/features/developers/data/repo/developers_repo.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/statistics/data/repo/statistics_repo.dart';
import 'package:crm/features/statistics/logic/statistics_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Core Services
  Dio dio = DioFactory.getDioInstance();
  getIt.registerLazySingleton(() => ApiService(dio));

  // ⭐ Register UserService as singleton
  getIt.registerLazySingleton(() => UserService());

  // Initialize UserService (load user from storage)
  await getIt<UserService>().init();

  // Repositories
  getIt.registerLazySingleton(() => LoginRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => ProjectsRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => DevelopersRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => StatisticsRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => LeadsRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => AddClientRepo(apiService: getIt()));

  getIt.registerFactory(() => StatisticsCubit(getIt()));

  // ⭐⭐⭐ Cubits - Register LoginCubit as Factory
  getIt.registerFactory(() => LoginCubit(loginRepo: getIt()));
  getIt.registerFactory(() => AddClientCubit(addClientRepo: getIt()));
  getIt.registerFactory(() => ProjectCubit(projectsRepo: getIt()));
  getIt.registerFactory(() => DeveloperCubit(developersRepo: getIt()));
  getIt.registerFactory(() => LeadsCubit(projectsRepo: getIt()));

  getIt.registerFactory(() => LayoutCubit());
}
