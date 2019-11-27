import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String appName;
  final String appMotto;
  final String textFont;

  /// The size of the title
  /// Takes value from
  /// size \in [1, 5]
  ///
  /// size=1:
  /// size=2:
  /// size=3:
  /// size=4:
  /// size=5:
  final int size;

  const AppTitle(
      {Key key,
      this.appName = "赚小钱",
      this.appMotto = "选择你自己的路",
      this.textFont = 'happyfont',
      this.size = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[generateName(), generateMotto()],
    ));
  }

  Widget generateName() {
    return new Text(appName,
        style: new TextStyle(
            color: Colors.black,
            fontSize: getPrimaryFontSize(),
            fontFamily: textFont));
  }

  Widget generateMotto() {
    return new Text(appMotto,
        style: new TextStyle(
            color: Color.fromARGB(255, 248, 130, 0),
            fontSize: getSecondaryFontSize(),
            fontFamily: textFont));
  }

  double getPrimaryFontSize() {
    switch (this.size) {
      case 1:
        return 20;
      case 2:
        return 40;
      case 3:
        return 60;
      case 4:
        return 80;
      case 5:
        return 100;
      default:
        return 60;
    }
  }

  double getSecondaryFontSize() {
    switch (this.size) {
      case 1:
        return 10;
      case 2:
        return 20;
      case 3:
        return 30;
      case 4:
        return 40;
      case 5:
        return 60;
      default:
        return 30;
    }
  }
}
