import 'package:mvvm_getx/data/network/network_api_services.dart';
import 'package:mvvm_getx/models/Home/user_list_model.dart';
import 'package:mvvm_getx/resources/app%20url/app_url.dart';

class HomeRepository {
  final _appService = NetworkApiServices();

  Future<UserListModel> getApi() async {
    //print(data);
    final response = await _appService.getApi(AppUrl.userListUrl);

    return UserListModel.fromJson(response);
  }
}
