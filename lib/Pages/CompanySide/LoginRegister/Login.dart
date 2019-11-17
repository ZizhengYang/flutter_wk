import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Weight/Clipper/AppBarClipper.dart';
import 'package:test_wai_kuai/Weight/Clipper/LoginSignupClipper.dart';

class Login extends StatelessWidget{

  int loginType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        backgroundColor: Color(0xFF2D3447),
        leading: new IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {Navigator.pop(context);}),
        elevation: 0
      ),
      body: new Stack(
        children: <Widget>[
          new ClipPath(
            child: Container(
                height: 60,
                color: Color(0xFF2D3447)
            ),
            clipBehavior: Clip.antiAlias,
            clipper: AppBarClipper(),
          ),
          new Container(
            child: new ClipPath(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.only(top: 80, left: 0, right: 0, bottom: 0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.red
                      ),
                      width: 300.0,
                      height: 440.0,
//                      color: Colors.red//Color(0xFF2D3447),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              clipper: LoginSignupClipper(),
            )
          )
        ],
      )
    );
  }
}