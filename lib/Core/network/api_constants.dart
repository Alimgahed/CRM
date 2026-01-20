class ApiConstants {
  static const baseUrl = "https://hiestate.app/api/";
  static const String login = "/users/login";
  static const String registerEndpoint = 'register';
  static const String allprojects = '/api/v1/projects';
  static const String getAllDevelopmentCompanies =
      "/dev-companies/listDevCompanies";
  static const String getAllLeads = "/api/v1/leads";
  static const String getStatistics = "/api/v1/agent-actions/statistics";
  static const String getAllUsers = "/users/getAll";
  static const String saveUser = "/users/saveUser";
  static const String getAllLeadsSource = "/api/v1/leads/leadsorce";
  static const String getAllLeadsComments = "/api/v1/leads/comments/";
  static const String getAllRoles = "/roles/getAll";
  static const String getAllUnit = "/api/v1/units";
  static const String getAllOwners = "/api/v1/owners";
  static const String editUser = "/users/saveUser/{id}";
  static const String getAllTasks = "/api/v1/tasks";
  static const String getLeadAgentActions =
      "/api/v1/leads/agent-actions/{leadId}";
}
