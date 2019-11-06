import 'package:flutter/material.dart';



class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(   // Row for the first Button
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 10),
              child:RaisedButton(
                child:Text('我要赚钱'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10) ),
                onPressed: (){
                  print("这是一个普通按钮");
                },
              ),
            )
          ],
        ),
        Row(   // Row for the second Button
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 10),
              child:RaisedButton(
                child:Text('我要外包'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10) ),
                onPressed: (){
                  print("这是一个普通按钮");
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}