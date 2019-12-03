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

  String avatar;
  String username;
  String phoneNum;
  String verificationCode;
  List<int> recommendation;
  bool gender;

  void getUserInfo(String data) {
    this.avatar = jsonDecode(data)['avatar'];
    this.username = jsonDecode(data)['username'];
    this.recommendation = jsonDecode(data)['recommendation'];
    this.gender = jsonDecode(data)['gender'];
  }

  void loginHandler(String data) {
    var username = jsonDecode(data)['username'];
    if (username == null) {
      Map<String, String> req = {'phoneNum': phoneNum, 'verificationCode': verificationCode};
      HttpController.post("", req, singupHandler);
    }
    else {
      getUserInfo(data);
    }
  }

  void singupHandler(String data) {
    getUserInfo(data);
  }

  void login() {
    Map<String, String> req = {'phoneNum': phoneNum};
    HttpController.post("67.207.87.166/user/login", req, loginHandler);
  }

  Map<String, dynamic> toJson() => {'avatar': avatar, 'username': username, 'phoneNum': phoneNum, 'recommendation': recommendation, 'gender': gender};

  String getJSON() {
    return jsonEncode(this.toJson());
  }

}