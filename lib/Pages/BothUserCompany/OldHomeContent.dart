//import 'dart:ui';
//import 'dart:ui' as prefix0;
//
//import 'package:flutter/material.dart';
//import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Login.dart';
//import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';
//import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';
//
//class OldHomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        body: Container(
//          decoration: new BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('images/work.jpg'),
//                  colorFilter: ColorFilter.mode(
//                      Colors.black.withOpacity(0.555), BlendMode.multiply),
//                  fit: BoxFit.cover)),
//          child: Column(
//            children: <Widget>[
//              Container(
//                child: Container(
//                    margin:
//                    EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
//                    child: Text("赚小钱",
//                        style: TextStyle(
//                            fontSize: 60,
//                            color: Colors.white,
////                            fontWeight: FontWeight.bold,
//                            fontStyle: FontStyle.italic,
//                            fontFamily: 'happyfont'))),
//              ),
//              new Stack(
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        height: 50,
//                        width: 300,
//                        margin: EdgeInsets.only(
//                            top: 10, left: 20, right: 20, bottom: 10),
//                        child: RaisedButton(
//                          elevation: 2.0,
//                          // normal elevation
//                          highlightElevation: 8.0,
//                          // on press elevation
//                          color: Colors.orange[800],
//                          //Color(0xFF2D3447),
//                          highlightColor: Colors.yellow[600],
//                          textColor: Colors.white,
//                          colorBrightness: Brightness.light,
//                          splashColor: Colors.lime,
//                          child: Text(" 我 要 发 兼 职 ", style: TextStyle(fontSize: 27)),
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10.0)),
//                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              new MaterialPageRoute(
//                                  builder: (context) => new Register()),
//                            );
//                          },
//                        ),
//                      )
//                    ],
//                  ),
//                  new BackdropFilter(filter: new prefix0.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), child: new Container(color: Colors.black.withOpacity(0.2)))
//                ],
//              ),
////    我 要 赚 外 快
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    height: 50,
//                    width: 300,
//                    margin: EdgeInsets.only(
//                        top: 10, left: 20, right: 20, bottom: 10),
//                    child: RaisedButton(
//                      elevation: 2.0,
//                      // normal elevation
//                      highlightElevation: 8.0,
//                      // on press elevation
//                      color: Colors.orange[800],
//                      //Color(0xFF2D3447),
//                      highlightColor: Colors.yellow[600],
//                      textColor: Colors.white,
//                      colorBrightness: Brightness.light,
//                      splashColor: Colors.lime,
//                      child: Text(" 我 要 发 兼 职 ", style: TextStyle(fontSize: 27)),
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(10.0)),
//                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (context) => new Register()),
//                        );
//                      },
//                    ),
//                  )
//                ],
//              ),
//            ],
//          ),
//        )
//    );
//  }
//}
//
//// TODO: testing class
//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Second Screen"),
//      ),
//      body: new Center(
//        child: new RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: new Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/ChooseLoginRegistion.dart';
import 'package:test_wai_kuai/Pages/UserSide/ChooseLoginType.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class OldHomeContent extends StatelessWidget {
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
              new OldHomeContentChoices()
            ])));
  }
}

class OldHomeContentChoices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare(image: 'assets/images/business/101-meeting.png', size: 120, top: 280, text: " 我 要 赚 外 快", target: ChooseLoginType(), margin: 20),
        new PopIconButton_RoundedSquare(image: 'assets/images/business/101-orders.png', size: 120, top: 280, text: " 我 要 发 兼 职 ", target: ChooseLoginRegistion(), margin: 20)
      ],
    );
  }

}
