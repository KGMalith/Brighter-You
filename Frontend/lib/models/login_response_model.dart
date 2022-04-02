import 'dart:convert';

LoginResponseModel loginReponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.data,
    required this.msg,
  });
  late final bool status;
  late final Data? data;
  late final String msg;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data!.toJson();
    _data['msg'] = msg;
    return _data;
  }
}

class Data {
  Data({
    required this.token,
  });
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    return _data;
  }
}
