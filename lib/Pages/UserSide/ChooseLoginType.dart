import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/PhoneLogin.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/WechatLogin.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class ChooseLoginType extends StatelessWidget {
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
              new ChooseLoginTypeChoices()
            ])));
  }
}

class ChooseLoginTypeChoices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare(image: 'assets/images/messager/035-wechat.png', size: 80, top: 300, text: " 微 信 登 录 ", target: WechatLogin(), margin: 8),
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/telephone.png', size: 80, top: 300, text: " 电 话 登 录 ", target: PhoneLogin(), margin: 8),
        new PopIconButton_RoundedSquare_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", margin: 8)
      ],
    );
  }

}
