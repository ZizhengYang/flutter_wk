import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-20);
    // 控制点1
    var firstControlPoint = Offset(size.width/4, size.height);
    // 第一段贝塞尔曲线终点
    var firstEndPoint = Offset(size.width/2.25, size.height-30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    // 控制点2
    var secondControlPoint = Offset(size.width - (size.width / 3.25), size.height - 65);
    // 第二段贝塞尔曲线终点
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}