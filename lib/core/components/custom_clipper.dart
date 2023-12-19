import 'package:flutter/material.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(width, height);
    path.lineTo(width, 0);

    var secondControlPoint = const Offset(0, 0);
    var secondEndPoint = Offset(width * 0.2, height * 0.3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var fifthControlPoint = Offset(width * 3, height * 0.5);
    var fifthEndPoint = Offset(width * 0.23, height * 0.6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndPoint.dx, fifthEndPoint.dy);

    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}