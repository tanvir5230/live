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
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toLowerCase(),
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
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
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toLowerCase(),
              style: TextStyle(
                color: Colors.white.withOpacity(.8),
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
