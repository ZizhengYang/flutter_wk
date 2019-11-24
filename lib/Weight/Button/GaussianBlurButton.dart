import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';

class GaussianBlurButton extends StatelessWidget {

  String text;
  double elevation;
  double highlightElevation;
  Color color;
  Color highlightColor;
  Color textColor;
  Brightness colorBrightness;
  Color splashColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: elevation,
      // normal elevation
      highlightElevation: highlightElevation,
      // on press elevation
      color: color,
      highlightColor: highlightColor,
      textColor: textColor,
      colorBrightness: colorBrightness,
      splashColor: splashColor,
      child: Text(text, style: TextStyle(fontSize: 27)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new Register()
          ),
        );
      },
    );
  }

}