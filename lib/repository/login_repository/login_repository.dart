import 'package:mvvm_getx/data/network/network_api_services.dart';
import 'package:mvvm_getx/resources/app%20url/app_url.dart';

class LoginRepository {
  final _appService = NetworkApiServices();

  Future<dynamic> loginApi(data) async {
    //print(data);
    final response = await _appService.postApi(data, AppUrl.loginURl);
    return response;
  }
}
