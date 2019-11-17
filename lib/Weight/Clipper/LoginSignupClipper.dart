import 'package:flutter/material.dart';

class LoginSignupClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    var circleSize = 40.0;
    var radiusSize = 80.0;

    var path = Path();

    path.addRRect(new RRect.fromLTRBR(10, 10, size.width, size.height, new Radius.circular(10.0)));

//    path.moveTo(radiusSize, 0.0);
//    path.lineTo(0.0, radiusSize);
//    path.lineTo(0.0, size.height-circleSize-radiusSize);
//    path.lineTo(radiusSize, size.height-circleSize);
//    path.lineTo((1/2)*size.width-circleSize, size.height-circleSize);
//    path.lineTo((1/2)*size.width, size.height);
//    path.lineTo((1/2)*size.width+circleSize, size.height-circleSize);
//    path.lineTo(size.width-radiusSize, size.height-circleSize);
//    path.lineTo(size.width, size.height-circleSize-radiusSize);
//    path.lineTo(size.width, radiusSize);
//    path.lineTo(size.width-radiusSize, 0.0);
//
//    var controlPoint = Offset((1/2)*size.width, size.height);
//
//    path.moveTo((1/2)*size.width-circleSize, size.height-circleSize);
//    var controlPoint1 = Offset((1/2)*size.width-circleSize, size.height);
//    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);
//
//    path.moveTo((1/2)*size.width+circleSize, size.height-circleSize);
//    var controlPoint2 = Offset((1/2)*size.width+circleSize, size.height);
//    path.cubicTo(controlPoint2.dx, controlPoint2.dy, controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy);
//
//    path.moveTo(0.0, size.height-circleSize-radiusSize);
//    var controlPoint3 = Offset(0.0, size.height-circleSize);
//    var controlPoint4 = Offset(radiusSize, size.height-circleSize);
//    path.cubicTo(controlPoint3.dx, controlPoint3.dy, controlPoint4.dx, controlPoint4.dy, controlPoint4.dx, controlPoint4.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
