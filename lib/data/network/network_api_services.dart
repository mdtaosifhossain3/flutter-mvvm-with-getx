import 'dart:convert';
import 'dart:io';

import 'package:mvvm_getx/data/app_exceptions.dart';
import 'package:mvvm_getx/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExecption;
    } on RequestTimeOut {
      throw RequestTimeOut;
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExecption;
    } on RequestTimeOut {
      throw RequestTimeOut;
    }

    return responseJson;
  }

  @override
  Future<dynamic> updateApi(dynamic data, String url, int idx) async {
    dynamic responseJson;
    try {
      final response = await http
          .patch(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExecption;
    } on RequestTimeOut {
      throw RequestTimeOut;
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            "Error While Communicating with the server${response.statusCode.toString()}");
    }
  }
}
