import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:crm/features/Units/data/models/unit_response.dart';
import 'package:crm/features/actions/data/model/company_actions.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/actions/data/model/lead_actions_response.dart';
import 'package:crm/features/auth/login/data/model/login_ipa_response.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/clients/data/model/comment_response.dart';
import 'package:crm/features/clients/data/model/lead_sorce_response.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/data/model/leads_response.dart';
import 'package:crm/features/clients/data/model/request_model.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';
import 'package:crm/features/owners/data/models/owner_respone.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:crm/features/tasks/data/model/task_model.dart';
import 'package:crm/features/tasks/data/model/task_respone.dart';
import 'package:crm/features/users/data/model/roles_response.dart';
import 'package:crm/features/users/data/model/user_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginApiResponse> login(@Body() LoginRequestBody body);

  @GET(ApiConstants.allprojects)
  Future<ProjectResponse> getAllProjects();

  @GET(ApiConstants.getAllDevelopmentCompanies)
  Future<CompaniesResponse> getAllDevelopmentCompanies();

  @GET(ApiConstants.getStatistics)
  Future<AgentActionStatisticsResponse> getAgentActionStatistics();

  @GET(ApiConstants.getAllLeads)
  Future<LeadsResponse> getAllLeads();
  @POST(ApiConstants.saveLead)
  Future<dynamic> addLead(@Body() Lead body);
  @GET(ApiConstants.getAllUsers)
  Future<UsersResponse> getAllUsers();
  @GET(ApiConstants.getAllLeadsSource)
  Future<LeadSourceResponse> getAllLeadsSource();
  @POST(ApiConstants.saveUser)
  Future<dynamic> addUser(@Body() UsersModel body);
  @GET(ApiConstants.getAllRoles)
  Future<RolesResponse> getAllRoles();
  @GET(ApiConstants.getAllUnit)
  Future<UnitResponse> getAllUnit();
  @GET(ApiConstants.getAllOwners)
  Future<OwnerResponse> getAllOwners();
  @GET(ApiConstants.getAllTasks)
  Future<TaskRespone> getAllTasks();
  @POST(ApiConstants.getAllTasks)
  Future<dynamic> addTask(@Body() TaskModel body);
  @POST(ApiConstants.getLeadAgentActions)
  Future<LeadActionsResponse> getLeadAgentActions(
    @Body() Map<String, dynamic> body,
  );
  @GET(ApiConstants.getAllCompanyActions)
  Future<CompanyActionsResponse> getCompanyActions();
  @POST(ApiConstants.saveAgentAction)
  Future<dynamic> addAgentAction(@Body() LeadActionModel body);
  @POST(ApiConstants.leadComments)
  Future<CommentResponse> getLeadComments(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.saveLeadComment)
  Future<dynamic> addLeadComment(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.getLeadBuyingRequests)
  Future<RequestResponse> getLeadBuyingRequests(
    @Body() Map<String, dynamic> body,
  );
}
