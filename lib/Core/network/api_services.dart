import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Units/data/models/unit_response.dart';
import 'package:crm/features/actions/data/model/lead_actions_response.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/model/login_response.dart';
import 'package:crm/features/clients/data/model/lead_sorce_response.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/data/model/leads_response.dart';
import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:crm/features/owners/data/models/owner_respone.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:crm/features/tasks/data/model/task_model.dart';
import 'package:crm/features/tasks/data/model/task_respone.dart';
import 'package:crm/features/users/data/model/add_user_model.dart';
import 'package:crm/features/users/data/model/roles_response.dart';
import 'package:crm/features/users/data/model/user_response.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @GET(ApiConstants.allprojects)
  Future<ProjectsResponse> getAllProjects();

  @GET(ApiConstants.getAllDevelopmentCompanies)
  Future<DevCompanyListResponse> getAllDevelopmentCompanies();

  @GET(ApiConstants.getStatistics)
  Future<AgentActionStatisticsResponse> getAgentActionStatistics();

  @GET(ApiConstants.getAllLeads)
  Future<LeadsResponse> getAllLeads();
  @POST(ApiConstants.getAllLeads)
  Future<String> addLead(@Body() Lead body);
  @GET(ApiConstants.getAllUsers)
  Future<UsersResponse> getAllUsers();
  @GET(ApiConstants.getAllLeadsSource)
  Future<LeadSourceResponse> getAllLeadsSource();
  @POST(ApiConstants.getAllUsers)
  Future<String> addUser(@Body() AddUserModel body);
  @GET(ApiConstants.getAllRoles)
  Future<RolesResponse> getAllRoles();
  @PUT(ApiConstants.editUser)
  Future<String> editUser(@Path("id") String id, @Body() User body);
  @GET(ApiConstants.getAllUnit)
  Future<UnitResponse> getAllUnit();
  @GET(ApiConstants.getAllOwners)
  Future<OwnerResponse> getAllOwners();
  @GET(ApiConstants.getAllTasks)
  Future<TaskRespone> getAllTasks();
  @POST(ApiConstants.getAllTasks)
  Future<String> addTask(@Body() TaskModel body);
  @GET(ApiConstants.getLeadAgentActions)
  Future<LeadActionsResponse> getLeadAgentActions(
    @Path("leadId") String leadId,
  );
}
