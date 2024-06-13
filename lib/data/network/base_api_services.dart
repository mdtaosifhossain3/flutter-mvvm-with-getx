abstract class BaseApiServices {
  //Get Api
  Future<dynamic> getApi(String url);
  //Post Api
  Future<dynamic> postApi(dynamic data, String url);
  //Update Api
  Future<dynamic> updateApi(dynamic data, String url, int idx);
}
