import 'package:flutter/material.dart';

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final p0 = size.height;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.6, size.height);
    final endPoint = Offset(size.width * 0.7, size.height * 0.4);
    path.cubicTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => false;
}

class BackgroundWaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.6;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.4, size.height * 0.5);
    final endPoint = Offset(size.width * 0.7, size.height);
    path.cubicTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
      size.width,
      size.height * 0.9,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper1 oldClipper) => false;
}
