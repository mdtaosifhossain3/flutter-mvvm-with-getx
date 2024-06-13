import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/status.dart';
import 'package:mvvm_getx/resources/routes/routes_name.dart';
import 'package:mvvm_getx/view_model/controllers/home/user_list_controller.dart';
import 'package:mvvm_getx/view_model/controllers/share_preference/user_preference.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final user = UserPreference();
  final _controller = Get.put(UserListController());

  @override
  void initState() {
    _controller.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: .3,
          centerTitle: true,
          title: const Text("Home"),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                  onTap: () {
                    user.removeUser().then((val) {
                      Get.offAllNamed(RoutesName.loginView);
                    }).onError(
                      (error, stackTrace) {},
                    );
                  },
                  child: const Icon(Icons.logout)),
            )
          ],
        ),
        body: Obx(() {
          switch (_controller.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case Status.ERROR:
              return const Center(
                child: Text("Something went wrong"),
              );

            case Status.COMPLETED:
              return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: _controller.rxUserList.value.data!.length,
                  itemBuilder: (context, index) {
                    final item = _controller.rxUserList.value.data![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: ListTile(
                        title: Text("${item.firstName} ${item.lastName}"),
                        subtitle: Text(item.email.toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(item.avatar.toString()),
                        ),
                      ),
                    );
                  });
          }
        }));
  }
}
