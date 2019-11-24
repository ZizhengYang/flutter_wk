import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginSignupPainter extends CustomPainter {

  const LoginSignupPainter({this.height=440, this.width=300});

  final double height;
  final double width;
  final circleSize = 40.0;
  final radiusSize = 30.0;

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    var path = Path();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
//    paint.strokeCap = StrokeCap.butt;

    path.moveTo(radiusSize, 0.0);
    path.lineTo(0.0, radiusSize);
    path.lineTo(0.0, height-circleSize-radiusSize);
    path.lineTo(radiusSize, height-circleSize);
    path.lineTo((1/2)*width-circleSize, height-circleSize);
    path.lineTo((1/2)*width, height);
    path.lineTo((1/2)*width+circleSize, height-circleSize);
    path.lineTo(width-radiusSize, height-circleSize);
    path.lineTo(width, height-circleSize-radiusSize);
    path.lineTo(width, radiusSize);
    path.lineTo(width-radiusSize, 0.0);

    var controlPoint = Offset((1/2)*width, height);

    path.moveTo((1/2)*width-circleSize, height-circleSize);
    var controlPoint1 = Offset((1/2)*width-circleSize, height);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);

    path.moveTo((1/2)*width+circleSize, height-circleSize);
    var controlPoint2 = Offset((1/2)*width+circleSize, height);
    path.cubicTo(controlPoint2.dx, controlPoint2.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);

    path.moveTo(0.0, height-circleSize-radiusSize);
    var controlPoint3 = Offset(0.0, height-circleSize);
    var controlPoint4 = Offset(radiusSize, height-circleSize);
    path.cubicTo(controlPoint3.dx, controlPoint3.dy, controlPoint4.dx, controlPoint4.dy, controlPoint4.dx, controlPoint4.dy);

    path.moveTo(width-radiusSize, height-circleSize);
    var controlPoint5 = Offset(width, height-circleSize);
    var controlPoint6 = Offset(width, height-circleSize-radiusSize);
    path.cubicTo(controlPoint5.dx, controlPoint5.dy, controlPoint6.dx, controlPoint6.dy, controlPoint6.dx, controlPoint6.dy);

    path.moveTo(width, radiusSize);
    var controlPoint7 = Offset(width, 0.0);
    var controlPoint8 = Offset(width-radiusSize, 0.0);
    path.cubicTo(controlPoint7.dx, controlPoint7.dy, controlPoint8.dx, controlPoint8.dy, controlPoint8.dx, controlPoint8.dy);

    path.moveTo(radiusSize, 0.0);
    var controlPoint9 = Offset(0.0, 0.0);
    var controlPoint10 = Offset(0.0, radiusSize);
    path.cubicTo(controlPoint9.dx, controlPoint9.dy, controlPoint10.dx, controlPoint10.dy, controlPoint10.dx, controlPoint10.dy);

    path.close();

    canvas.drawShadow(path, Colors.black, 4.0, true);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

//class LoginSignupShadowPainter extends CustomPainter {
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    Path path = Path();
//
//    path.moveTo(width, height * 0.14);
//    path.lineTo(width, height * 1.0);
//    path.lineTo(width - (width  *0.99) , height);
//    path.close();
//
//    canvas.drawShadow(path, Colors.black45, 3.0, false);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//
//}