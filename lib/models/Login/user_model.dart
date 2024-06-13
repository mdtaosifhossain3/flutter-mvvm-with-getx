class UserModel {
  String? token;
  bool? isLogedin;

  UserModel({this.token, this.isLogedin});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogedin = json['isLogedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['isLogedin'] = isLogedin;
    return data;
  }
}
