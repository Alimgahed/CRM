import 'package:crm/Core/network/api_services.dart';
import 'package:crm/Core/network/dio_factory.dart';
import 'package:crm/Core/services/user_service.dart';
import 'package:crm/features/Projects/data/repo/projects_repo.dart';
import 'package:crm/features/Projects/logic/cubit/project_cubit.dart';
import 'package:crm/features/Units/data/repos/units.repo.dart';
import 'package:crm/features/Units/logic/cubit/unit_cubit.dart';
import 'package:crm/features/actions/data/repo/add_client_repo.dart';
import 'package:crm/features/actions/data/repo/lead_action.dart';
import 'package:crm/features/actions/logic/cubit/action_cubit.dart';
import 'package:crm/features/actions/logic/cubit/add_client.dart';
import 'package:crm/features/auth/login/data/repos/login_repo.dart';
import 'package:crm/features/auth/login/cubit/login_cubit.dart';
import 'package:crm/features/clients/data/repo/all_clients.dart';
import 'package:crm/features/clients/data/repo/lead_soure.dart';
import 'package:crm/features/clients/logic/cubit/leads_cubit.dart';
import 'package:crm/features/developers/data/repo/developers_repo.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/owners/data/repo/owner_repo.dart';
import 'package:crm/features/owners/logic/cubit/owner_cubit.dart';
import 'package:crm/features/statistics/data/repo/statistics_repo.dart';
import 'package:crm/features/statistics/logic/statistics_cubit.dart';
import 'package:crm/features/tasks/data/repo/add_task_repo.dart';
import 'package:crm/features/tasks/data/repo/task_repo.dart';
import 'package:crm/features/tasks/logic/cubit/add_task_cubit.dart';
import 'package:crm/features/tasks/logic/cubit/task_cubit.dart';
import 'package:crm/features/users/data/repo/add_user_repo.dart';
import 'package:crm/features/users/data/repo/edit_user_repo.dart';
import 'package:crm/features/users/data/repo/roles_repo.dart';
import 'package:crm/features/users/data/repo/user_repo.dart';
import 'package:crm/features/users/logic/cubit/add_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/edit_user_cubit.dart';
import 'package:crm/features/users/logic/cubit/roles_cubit.dart';
import 'package:crm/features/users/logic/cubit/users_cubit.dart';
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
  getIt.registerLazySingleton(() => UserRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => LeadSourceRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => RolesRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => AddUserRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => EditUserRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => UnitsRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => OwnerRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => TaskRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => AddTaskRepo(apiService: getIt()));
  getIt.registerLazySingleton(() => LeadActionRepo(apiService: getIt()));

  // ⭐⭐⭐ Cubits - Register LoginCubit as Factory
  getIt.registerFactory(() => LoginCubit(loginRepo: getIt()));
  getIt.registerFactory(() => AddClientCubit(addClientRepo: getIt()));
  getIt.registerFactory(() => OwnerCubit(ownerRepo: getIt()));
  getIt.registerFactory(() => TaskCubit(taskRepo: getIt()));
  getIt.registerFactory(() => ActionCubit(leadActionRepo: getIt()));

  getIt.registerFactory(() => StatisticsCubit(getIt()));
  getIt.registerFactory(() => AddTaskCubit(addTaskRepo: getIt()));
  getIt.registerFactory(() => ProjectCubit(projectsRepo: getIt()));
  getIt.registerFactory(() => EditUserCubit(editUserRepo: getIt()));
  getIt.registerFactory(() => UsersCubit(userRepo: getIt()));
  getIt.registerFactory(() => UnitCubit(unitsRepo: getIt()));
  getIt.registerFactory(() => DeveloperCubit(developersRepo: getIt()));
  getIt.registerFactory(() => LeadsCubit(projectsRepo: getIt()));
  getIt.registerFactory(() => RolesCubit(rolesRepo: getIt()));
  getIt.registerFactory(() => AddUserCubit(addUserRepo: getIt()));

  getIt.registerFactory(() => LayoutCubit());
}
