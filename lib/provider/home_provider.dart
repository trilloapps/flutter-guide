import 'package:flutter/cupertino.dart';
import 'package:test_demo/helper/router_helper.dart';
import '../data/model/auth_model.dart';
import '../data/model/cases_model.dart';
import '../data/repository/api_repo.dart';
import '../utils/api_urls.dart';

class HomeProvider extends ChangeNotifier{
  ApiRepo apiRepo = ApiRepo();
  AuthModel authModel = AuthModel();
  CasesData? apiData;


  Future<void> fetchData(BuildContext context) async {
    final response = await apiRepo.getRequest(
      context,
      RouterHelpers.noConnectionScreen,
      ApiUrl.casesData,
      {"tenantName": "cloud", "tenantType": ""},
      bearerToken: authModel.accessToken,
    );
    if (response.statusCode == 200) {
      // Parse the API response and update the provider
      final data = response.data['data'] as Map<String, dynamic>;
      print(data);
      apiData = CasesData(
        totalStores: data['totalStores'.toString()] as int? ?? 0,
        percentageChangeStores: data['percentageChangeStores'] as double? ?? 0,
        totalCasesYTD: data['totalCasesYTD'] as double? ?? 0,
        percentageChangeYTD: data['percentageChangeYTD'] as double? ?? 0,
      );
      notifyListeners();
    }
  }
}