import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Login.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          body: Container(
        decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/work.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.555), BlendMode.multiply),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                  margin:
                      EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
                  child: Text("全民外快",
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 300,
                    margin: EdgeInsets.only(
                        top: 270, left: 20, right: 20, bottom: 10),
                    child: RaisedButton(
                      elevation: 2.0,
                      // normal elevation
                      highlightElevation: 8.0,
                      // on press elevation
                      color: Colors.orange[800],
                      highlightColor: Colors.yellow[600],
                      textColor: Colors.white,
                      colorBrightness: Brightness.light,
                      splashColor: Colors.lime,
                      child:
                          Text(" 我 要 赚 外 快 ", style: TextStyle(fontSize: 27)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Login()),
                        );
                      },
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 300,
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    child: RaisedButton(
                      elevation: 2.0,
                      // normal elevation
                      highlightElevation: 8.0,
                      // on press elevation
                      color: Colors.orange[800],
                      //Color(0xFF2D3447),
                      highlightColor: Colors.yellow[600],
                      textColor: Colors.white,
                      colorBrightness: Brightness.light,
                      splashColor: Colors.lime,
                      child:
                          Text(" 我 要 发 兼 职 ", style: TextStyle(fontSize: 27)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                    ))
              ],
            ),
          ],
        ),
      )
    );
  }
}

// TODO: testing class
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('Go back!'),
        ),
      ),
    );
  }
}
