import 'package:flutter/material.dart';

class LoginSignupClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height-(1/2-1/3)*size.width);
    path.lineTo((1/3)*size.width, size.height-(1/2-1/3)*size.width);
    path.lineTo((1/2)*size.width, size.height);
    path.lineTo((2/3)*size.width, size.height-(1/2-1/3)*size.width);
    path.lineTo(size.width, size.height-(1/2-1/3)*size.width);
    path.lineTo(size.width, 0.0);

    var controlPoint = Offset((1/2)*size.width, size.height);

    path.moveTo((1/3)*size.width, size.height-(1/2-1/3)*size.width);

    var controlPoint1 = Offset((1/3)*size.width, size.height);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);

    path.moveTo((2/3)*size.width, size.height-(1/2-1/3)*size.width);

    var controlPoint2 = Offset((2/3)*size.width, size.height);
    path.cubicTo(controlPoint2.dx, controlPoint2.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);

//    path.lineTo(0.0, size.height-2*(1/2-1/3)*size.width);
//    var controlPoint3 = Offset(0.0, size.height-(1/2-1/3)*size.width);
//    var controlPoint4 = Offset((1/2-1/3)*size.width, size.height-(1/2-1/3)*size.width);
//    var controlPoint4 = Offset((1/3)*size.width, size.height-(1/2-1/3)*size.width);
//    path.cubicTo(controlPoint3.dx, controlPoint3.dy, controlPoint4.dx, controlPoint4.dy, controlPoint4.dx, controlPoint4.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
