class ApiConstants {
  static const baseUrl = "https://hiestate.app/";
  static const String login = "/users/login";
  static const String registerEndpoint = 'register';
  static const String allprojects = 'api/projects/listProjects';
  static const String getAllDevelopmentCompanies =
      "api/dev-companies/listDevCompanies";
  static const String getAllLeads = "/api//leads/getAll";
  static const String getStatistics =
      "api/agent-actions/getAgentActionStatistics";
  static const String getAllUsers = "api//users/getAll";
  static const String saveLead = "api//leads/saveLead";

  static const String saveUser = "api//users/saveUser";
  static const String getAllLeadsSource = "/api/lead-sources";
  static const String getAllLeadsComments = "/api/v1/leads/comments/";
  static const String getAllRoles = "api//roles/getAll";
  static const String getAllUnit = "api//units/getAll";
  static const String getAllOwners = "api//owners/getAll";
  static const String getAllTasks = "api//tasks";
  static const String getAllCompanyActions =
      "api//companyActions/getAllCompanyActions";
  static const String getLeadAgentActions =
      "api/agent-actions/getAgentActionByLeadID";
  static const String saveAgentAction = "api/agent-actions/saveAgentAction";
  static const String getLeadComments = "api/leads/getCommentsForLead";
}
