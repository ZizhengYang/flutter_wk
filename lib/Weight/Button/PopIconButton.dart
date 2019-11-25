import 'package:flutter/material.dart';
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

class GaussianBlurButton_RoundedSquare extends StatelessWidget {

  String image;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: RaisedButton(
        child: new Container(
          child: Image.asset(image),
        ),
      ),
    );
  }

}