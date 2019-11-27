import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';

//class GaussianBlurButton_RoundedSquare extends MaterialButton {
//
//  final String text;
//  final double textSize;
//  final double elevationInner;
//  final double elevationOutter;
//  final double elevationInnerHighlight;
//  final double elevationOutterHighlight;
//  final double size;
//  final double centerSize;
//  final double sizeHighlight;
//  final double centerSizeHighlight;
//
//  const GaussianBlurButton_RoundedSquare({
//    Key key,
//    @required VoidCallback onPressed,
//    ValueChanged<bool> onHighlightChanged,
//    ButtonTextTheme textTheme,
//    Color textColor,
//    Color disabledTextColor,
//    Color color,
//    Color disabledColor,
//    Color focusColor,
//    Color hoverColor,
//    Color highlightColor,
//    Color splashColor,
//    Brightness colorBrightness,
//    double elevation,
//    double focusElevation,
//    double hoverElevation,
//    double highlightElevation,
//    double disabledElevation,
//    EdgeInsetsGeometry padding,
//    ShapeBorder shape,
//    Clip clipBehavior,
//    FocusNode focusNode,
//    bool autofocus = false,
//    MaterialTapTargetSize materialTapTargetSize,
//    Duration animationDuration,
//    Widget child,
//    this.text,
//    this.textSize,
//    this.elevationInner,
//    this.elevationOutter,
//    this.elevationInnerHighlight,
//    this.elevationOutterHighlight,
//    this.size,
//    this.centerSize,
//    this.sizeHighlight,
//    this.centerSizeHighlight,
//  }) : assert(autofocus != null),
//        assert(elevation == null || elevation >= 0.0),
//        assert(focusElevation == null || focusElevation >= 0.0),
//        assert(hoverElevation == null || hoverElevation >= 0.0),
//        assert(highlightElevation == null || highlightElevation >= 0.0),
//        assert(disabledElevation == null || disabledElevation >= 0.0),
//        super(
//        key: key,
//        onPressed: onPressed,
//        onHighlightChanged: onHighlightChanged,
//        textTheme: textTheme,
//        textColor: textColor,
//        disabledTextColor: disabledTextColor,
//        color: color,
//        disabledColor: disabledColor,
//        focusColor: focusColor,
//        hoverColor: hoverColor,
//        highlightColor: highlightColor,
//        splashColor: splashColor,
//        colorBrightness: colorBrightness,
//        elevation: elevation,
//        focusElevation: focusElevation,
//        hoverElevation: hoverElevation,
//        highlightElevation: highlightElevation,
//        disabledElevation: disabledElevation,
//        padding: padding,
//        shape: shape,
//        clipBehavior: clipBehavior,
//        focusNode: focusNode,
//        autofocus: autofocus,
//        materialTapTargetSize: materialTapTargetSize,
//        animationDuration: animationDuration,
//        child: child,
//      );
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//  }
//
//}

class PopIconButton_RoundedSquare extends StatelessWidget {

  final String image;
  final double size;
  final double top;
  final String text;
  final String font;
  final Widget target;
  final double margin;

  const PopIconButton_RoundedSquare({Key key, this.image, this.size, this.top, this.text, this.font='happyfont', this.target, this.margin});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 0, left: this.margin, right: this.margin, bottom: 0),
      child: new Column(
        children: <Widget>[
          new Container(
            height: this.size,
            width: this.size,
            child: new FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              backgroundColor: Colors.white,
              elevation: 2.0,
              highlightElevation: 8.0,
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => this.target
                  ),
                );
              },
//              child: new Image.asset(this.image, width: this.size, height: this.size, fit: BoxFit.contain)
              child: new ConstrainedBox(
                constraints: new BoxConstraints.expand(),
                child: new Container(
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage(this.image),
                      )
                  ),
                ),
              )
            )
          ),
          new Container(
              margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
              child: new Text(
                this.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: this.font,
                )
              )
          )
        ],
      )
    );
  }

}

class PopIconButton_RoundedSquare_return extends StatelessWidget {

  final String image;
  final double size;
  final double top;
  final String text;
  final String font;
  final double margin;

  const PopIconButton_RoundedSquare_return({Key key, this.image, this.size, this.top, this.text, this.font='happyfont', this.margin});

  @override
  Widget build(BuildContext context) {
    return new Container(
//        margin: EdgeInsets.only(top: this.top, left: this.margin, right: this.margin, bottom: 0),
        child: new Column(
          children: <Widget>[
            new Container(
                height: this.size,
                width: this.size,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  color: Colors.white,
                  elevation: 2.0,
                  highlightElevation: 8.0,
                  colorBrightness: Brightness.light,
                  onPressed: () {
                    Navigator.pop(context);
                  },
//              child: new Image.asset(this.image, width: this.size, height: this.size, fit: BoxFit.contain)
                  child: new Container(
                    decoration: new BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(this.image),
                        )
                    ),
                  ),
                )
            ),
            new Container(
                margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
                child: new Text(
                    this.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: this.font,
                    )
                )
            )
          ],
        )
    );
  }

}

class PopIconButton_RoundedSquare_function extends StatelessWidget {

  final String image;
  final double size;
  final double top;
  final String text;
  final String font;
  final VoidCallback target;
  final double margin;

  const PopIconButton_RoundedSquare_function({Key key, this.image, this.size, this.top, this.text, this.font='happyfont', this.target, this.margin});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(top: 0, left: this.margin, right: this.margin, bottom: 0),
        child: new Column(
          children: <Widget>[
            new Container(
                height: this.size,
                width: this.size,
                child: new FloatingActionButton(
                  shape: CircleBorder(),
//                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//                  color: Colors.white,
                  elevation: 2.0,
                  highlightElevation: 8.0,
//                  colorBrightness: Brightness.light,
                  onPressed: this.target,
                  backgroundColor: Colors.white,
                  child: new ConstrainedBox(
                    constraints: new BoxConstraints.expand(),
//                    child: new ClipRRect(
//                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                      child: Image.asset(this.image)
//                    )
                    child: new Container(
                      decoration: new BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          image: DecorationImage(
                            image: AssetImage(this.image),
                          )
                      ),
                    ),
                  )
                )
            ),
            new Container(
                margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
                child: new Text(
                    this.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: this.font,
                    )
                )
            )
          ],
        )
    );
  }

}

class PopIconButton_RoundedSquare_function_return extends StatelessWidget {

  final String image;
  final double size;
  final double top;
  final String text;
  final String font;
  final VoidCallback target;
  final double margin;

  const PopIconButton_RoundedSquare_function_return({Key key, this.image, this.size, this.top, this.text, this.font='happyfont', this.target, this.margin});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(top: this.top, left: this.margin, right: 0, bottom: 0),
        child: new Column(
          children: <Widget>[
            new Container(
                height: this.size,
                width: this.size,
                child: new FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  backgroundColor: Colors.white,
                  elevation: 4.0,
                  highlightElevation: 8.0,
                  onPressed: this.target,
                  child: new Container(
                    decoration: new BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(this.image),
                        )
                    ),
                  ),
                )
            ),
            new Container(
                margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
                child: new Text(
                    this.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: this.font,
                    )
                )
            )
          ],
        )
    );
  }

}