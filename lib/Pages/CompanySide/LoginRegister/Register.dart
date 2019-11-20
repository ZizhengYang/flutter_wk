import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Weight/Clipper/AppBarClipper.dart';
import 'package:test_wai_kuai/Weight/Clipper/LoginSignupClipper.dart';
import 'package:test_wai_kuai/Weight/Painter/LoginSignupPainter.dart';

class Register extends StatelessWidget{

  int loginType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: new AppBar(
            title: new Text("欢迎 加入 全民外快"),
            backgroundColor: Color(0xFF2D3447),
//        leading: new IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {Navigator.pop(context);}),
            elevation: 0.0
        ),
        body: new Stack(
            children: <Widget>[
              new ClipPath(
                child: Container(
                    height: 260,
                    color: Color(0xFF2D3447)
                ),
                clipBehavior: Clip.antiAlias,
                clipper: AppBarClipper(),
              ),
              new Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.topCenter,
                child: new CustomPaint(
                  painter: new LoginSignupPainter(width: 300, height: 450),
                  size: new Size(300, 440),
                ),
              ),
              new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(top: 420),
                        child: new RaisedButton(
                            elevation: 4.0,
                            highlightElevation: 8.0,
                            color: Color(0xFF2D3447),
                            highlightColor: Colors.grey[300],
                            shape: CircleBorder(side: BorderSide.none),
                            child: Icon(Icons.navigate_next, color: Colors.white, size: 30.0),
                            onPressed: () {}
                        ),
                      )
                  )
                ],
              )
            ]
        )
    );
  }
}