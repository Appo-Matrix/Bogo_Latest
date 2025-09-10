import 'package:flutter/material.dart';

class QuadVerticalNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 6, 0);
    path.quadraticBezierTo(
        size.width / 4, size.height / 3.5, size.width / 3, 0);
    path.lineTo(size.width / 1.5, 0);
    path.quadraticBezierTo(
        size.width / 1.35, size.height / 3.5, size.width / 1.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 1.2, size.height);
    path.quadraticBezierTo(
        size.width / 1.35, size.height / 1.4, size.width / 1.5, size.height);
    path.lineTo(size.width / 3, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height / 1.4, size.width / 6, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ChatNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 5);
    path.lineTo(size.width / 12, size.height / 5);
    path.lineTo(size.width / 8, 0);
    path.lineTo(size.width / 6, size.height / 5);
    path.lineTo(size.width, size.height / 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DoubleVerticalNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 5, 0);
    path.quadraticBezierTo(
        size.width / 3.7, size.height / 7.8, size.width / 3, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 3, size.height);
    path.quadraticBezierTo(
        size.width / 3.7, size.height / 1.1, size.width / 5, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SingleHorizontalNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 2.5);
    path.quadraticBezierTo(
        size.width / 1.15, size.height / 2, size.width, size.height / 1.6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DoubleVerticalMidNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2.25, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height / 5, size.width / 1.75, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 1.75, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.30, size.width / 2.25, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
class DoubleHorizontalNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height/1.4);
    path.quadraticBezierTo(size.width/1.15, size.height/1.325,size.width,size.height/1.25);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.lineTo(0,size.height/1.25);
    path.quadraticBezierTo(size.width/7.5,size.height/1.325,0,size.height/1.4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
