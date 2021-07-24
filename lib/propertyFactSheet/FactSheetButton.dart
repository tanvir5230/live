import 'dart:math';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

Widget factSheetButtonLeft(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Transform(
      transform: Matrix4.rotationZ(1 / 180 * pi),
      child: OutlineGradientButton(
        onTap: () {},
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toLowerCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white.withOpacity(.8),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.1),
            Colors.white.withOpacity(.9),
          ],
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
        strokeWidth: 2,
      ),
    ),
  );
}

Widget factSheetButtonRight(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Transform(
      transform: Matrix4.rotationZ(-1 / 180 * pi),
      child: OutlineGradientButton(
        onTap: () {},
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toLowerCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontSize: 10,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(.9),
            Colors.white.withOpacity(.1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        strokeWidth: 2,
      ),
    ),
  );
}
