import 'package:flutter/material.dart';

const BorderRadius borderRadius = BorderRadius.all(Radius.circular(11));
const BorderRadius inputFieldBorderRadius =
    BorderRadius.all(Radius.circular(20));
const TextStyle navigateButtonsStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_f30_w600_white = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_f22_w600_white = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_f20_w700_white = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_f18_w800_white = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_f18_w600_white = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Asap",
    decoration: TextDecoration.none);
const TextStyle text_f14_w400_white = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Asap");
const TextStyle text_w600_white = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Asap");

Route createRoute(page) {
  return PageRouteBuilder<String>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
