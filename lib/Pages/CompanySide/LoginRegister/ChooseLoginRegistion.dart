import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Login.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/PhoneLogin.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/WechatLogin.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class ChooseLoginRegistion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/work.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.555), BlendMode.multiply),
                    fit: BoxFit.cover)),
            child: new Column(children: <Widget>[
              new Center(
                  child: new Container(
                    margin:
                    EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 0),
                    child: new AppTitle(),
                  )),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/profile.png', size: 80, top: 300, text: " 创 建 帐 号 ", target: Register(), margin: 8),
                  new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/password-1.png', size: 80, top: 300, text: " 登 录 帐 号 ", target: Login(), margin: 8),
                  new PopIconButton_RoundedSquare_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", margin: 8)
                ],
              )
            ])));
  }
}
