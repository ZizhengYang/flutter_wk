import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_wai_kuai/Pages/BothUserCompany/MainNavigationBar.dart';
import 'package:test_wai_kuai/Util/Clipper/AppBarClipper.dart';
import 'package:test_wai_kuai/Util/Painter/LoginSignupPainter.dart';

class PhoneLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneLoginState();
  }
}

class PhoneLoginState extends State<PhoneLogin> {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: new AppBar(
            title: new Text("欢迎 使用 赚小钱"),
            backgroundColor: Color(0xFF2D3447),
            elevation: 0.0),
        body: new Stack(children: <Widget>[
          new ClipPath(
            child: Container(height: 260, color: Color(0xFF2D3447)),
            clipBehavior: Clip.antiAlias,
            clipper: AppBarClipper(),
          ),
          new Container(
            margin: EdgeInsets.only(top: 0),
            alignment: Alignment.topCenter,
            child: new CustomPaint(
              painter: new LoginSignupPainter(width: 300, height: 520),
              size: new Size(300, 520),
            ),
          ),
          new Stack(
            children: <Widget>[
              new SingleChildScrollView(
                child: new Container(
//                color: Colors.red,
                    child: new Column(
                        children: <Widget>[
                          new Container(
                              margin: EdgeInsets.only(top: 50),
                              child: new Text(
                                  "登录/注册",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                          ),
                          new Container(
                              child: new Text(
                                  "请输入您的手机号",
                                  style: TextStyle(
                                      color: Colors.grey
                              ))
                          ),
                          _buildTextField(this._textController1, "手机号", 100),
                          new Container(
                              child: new Text(
                                  "我们会保证您的个人隐私信息安全",
                                  style: TextStyle(
                                      color: Colors.grey,
                                  ))
                          ),
                          _buildTextField(this._textController2, "验证码", 100),
                          new Container(
                              child: new Text(
                                  "请输入您从手获得的短信验证码",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ))
                          ),
                          new Container(
                              margin: EdgeInsets.only(top: 10, left: 50),
                              alignment: Alignment.center,
                              child: new Row(
                                children: <Widget>[
                                  FlatButton(
                                    child: new Text(
                                        "用户协议",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        )),
                                    onPressed: () {},
                                  ),
                                  FlatButton(
                                    child: new Text(
                                        "隐私协议",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        )),
                                    onPressed: () {},
                                  ),
                                  FlatButton(
                                    child: new Text(
                                        "登录帮助",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        )),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                          )
                        ]))
              ),
              new Center(
                  child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(top: 400),
                child: new RaisedButton(
                    elevation: 4.0,
                    highlightElevation: 8.0,
                    color: Color(0xFF2D3447),
                    highlightColor: Colors.grey[300],
                    shape: CircleBorder(side: BorderSide.none),
                    child: Icon(Icons.navigate_next,
                        color: Colors.white, size: 30.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MainNavigationBar()),
                      );
                    }),
              ))
            ],
          )
        ]));
  }

  Widget _buildTextField(TextEditingController controller, String text, double width) {
    return new Center(
        child: new Container(
            margin: EdgeInsets.only(top: 30.0),
            color: Colors.white,
            width: width,
            constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
            child: new Theme(
              data: ThemeData(primaryColor: Color(0xFF2D3447), hintColor: Color(0xFF2D3447)),
              child: new TextField(
                controller: controller,
                maxLines: 1,
                obscureText: false,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入数字
                  ],
                style:
                TextStyle(fontSize: 16.0, color: Color(0xFF2D3447), fontFamily: ''),
                decoration: InputDecoration(
                    fillColor: null,
                    filled: false,
                    labelText: text,
                    hintText: "请输入"+text,
                    labelStyle: TextStyle(
                      color: Color(0xFF2D3447)
//                        fontWeight: FontWeight.bold,
//                        color: Color.fromARGB(255, 248, 130, 0)
                    ),
                    hintStyle: TextStyle(
                        letterSpacing: 2,
                        fontSize: 16.0, color: Colors.grey),//errorText: "手机号错误"
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), gapPadding: 4.0),
                    contentPadding: EdgeInsets.all(14)
                )))
        )
    );
  }
}
