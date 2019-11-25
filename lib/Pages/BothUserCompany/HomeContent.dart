import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Widght/Button/GaussianBlurButton.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class HomeContent extends StatelessWidget {
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
              new PopIconButton_RoundedSquare(image: "assets/images/business/101-meeting.png"),
              new PopIconButton_RoundedSquare(image: "assets/images/business/101-orders.png")
            ])));
  }
}
