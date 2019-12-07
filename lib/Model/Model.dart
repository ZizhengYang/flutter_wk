import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:test_wai_kuai/Util/Web/HttpController.dart';

//typedef bool Gender;

@JsonSerializable()
class Task {

  String name;
  Payment payment;
  String logo;

}

class Payment {

  PaymentType type;
  int upperBound;
  int lowerBound;

}

enum PaymentType {
  Hourly,
  Daily,
  Weekly,
  Monthly,
  Seasonally,
  yearly
}

@JsonSerializable()
class User {

  final String loginAddress = "http://167.172.204.161:8080/user/login";
//  final String loginAddress = "http://localhost:8080/user/login";

  String avatar;
  String username;
  String phoneNum;
  String verificationCode;

  void getUserInfo(String data) {
    this.avatar = jsonDecode(data)['avatar'];
    this.username = jsonDecode(data)['username'];
  }

  void loginHandler(String data) {
//    var username = jsonDecode(data)['username'];
//    if (username == null) {
//      Map<String, String> req = {'phoneNum': phoneNum, 'verificationCode': verificationCode};
//      HttpController.post(loginAddress, req, singupHandler);
//    }
//    else {
//      getUserInfo(data);
//    }
  }

  void singupHandler(String data) {
//    getUserInfo(data);
  }

  void login() {
    Map<String, String> req = {'phoneNum': phoneNum, 'verificationCode': verificationCode};
    HttpController.post(loginAddress, req, loginHandler);
  }

  Map<String, dynamic> toJson() => {'avatar': avatar, 'username': username, 'phoneNum': phoneNum};
  String getJSON() {
    return jsonEncode(this.toJson());
  }

}