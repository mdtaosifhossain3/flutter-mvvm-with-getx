import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/status.dart';
import 'package:mvvm_getx/models/Home/user_list_model.dart';
import 'package:mvvm_getx/repository/home/home_repository.dart';
import 'package:mvvm_getx/utils/utils.dart';

class UserListController extends GetxController {
  final _apiService = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxUserList = UserListModel().obs;
  setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  setRxUserList(UserListModel value) => rxUserList.value = value;

  void userListApi() {
    _apiService
        .getApi()
        .then((val) => {
              setRxRequestStatus(Status.COMPLETED),
              setRxUserList(val),
            })
        .onError((e, stackTract) => {
              setRxRequestStatus(Status.ERROR),
              Utils.snakbar("Error", e.toString())
            });
  }
}
