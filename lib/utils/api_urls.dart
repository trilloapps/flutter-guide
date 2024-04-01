class ApiUrl {
  ///BASE URl
  static String baseUrl = "https://api.apps-demo-2.trilloapps.com/ds/function/shared";


  ///AUTHENTICATION
  static String logInUrl = "https://api.apps-demo-2.trilloapps.com/_preauthsvc/user/authenticate";
  static String forgotPasswordUrl = "$baseUrl/_preauthsvc/user/forgotPassword";

  static String casesData = "$baseUrl/ds/function/shared/AppGetBusinessData";
  static String customerData = "$baseUrl/GetCustomers";
  static String getCustomerOrders = "$baseUrl/GetCustomerOrders";



}
